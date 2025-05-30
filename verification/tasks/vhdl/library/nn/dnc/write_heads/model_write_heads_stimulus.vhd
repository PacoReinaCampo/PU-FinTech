--------------------------------------------------------------------------------
--                                            __ _      _     _               --
--                                           / _(_)    | |   | |              --
--                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |              --
--               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |              --
--              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |              --
--               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|              --
--                  | |                                                       --
--                  |_|                                                       --
--                                                                            --
--                                                                            --
--              Peripheral-NTM for MPSoC                                      --
--              Neural Turing Machine for MPSoC                               --
--                                                                            --
--------------------------------------------------------------------------------

-- Copyright (c) 2020-2021 by the author(s)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
--------------------------------------------------------------------------------
-- Author(s):
--   Paco Reina Campo <pacoreinacampo@queenfield.tech>

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.model_math_pkg.all;
use work.model_write_heads_pkg.all;

entity model_write_heads_stimulus is
  generic (
    -- SYSTEM-SIZE
    DATA_SIZE    : integer := 64;
    CONTROL_SIZE : integer := 64;

    X : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(64, DATA_SIZE));  -- x in 0 to X-1
    Y : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(64, DATA_SIZE));  -- y in 0 to Y-1
    N : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(64, DATA_SIZE));  -- j in 0 to N-1
    W : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(64, DATA_SIZE));  -- k in 0 to W-1
    L : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(64, DATA_SIZE));  -- l in 0 to L-1
    R : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(64, DATA_SIZE))  -- i in 0 to R-1
    );
  port (
    -- GLOBAL
    CLK : out std_logic;
    RST : out std_logic;

    -- WRITE HEADS
    -- CONTROL
    DNC_WRITE_HEADS_START : out std_logic;
    DNC_WRITE_HEADS_READY : in  std_logic;

    DNC_WRITE_HEADS_XI_IN_ENABLE : out std_logic;

    DNC_WRITE_HEADS_XI_OUT_ENABLE : in std_logic;

    DNC_WRITE_HEADS_K_OUT_ENABLE : in std_logic;
    DNC_WRITE_HEADS_E_OUT_ENABLE : in std_logic;
    DNC_WRITE_HEADS_V_OUT_ENABLE : in std_logic;

    -- DATA
    DNC_WRITE_HEADS_SIZE_S_IN : out std_logic_vector(CONTROL_SIZE-1 downto 0);
    DNC_WRITE_HEADS_SIZE_W_IN : out std_logic_vector(CONTROL_SIZE-1 downto 0);

    DNC_WRITE_HEADS_XI_IN : out std_logic_vector(DATA_SIZE-1 downto 0);

    DNC_WRITE_HEADS_K_OUT    : in std_logic_vector(DATA_SIZE-1 downto 0);
    DNC_WRITE_HEADS_BETA_OUT : in std_logic_vector(DATA_SIZE-1 downto 0);
    DNC_WRITE_HEADS_E_OUT    : in std_logic_vector(DATA_SIZE-1 downto 0);
    DNC_WRITE_HEADS_V_OUT    : in std_logic_vector(DATA_SIZE-1 downto 0);
    DNC_WRITE_HEADS_GA_OUT   : in std_logic_vector(DATA_SIZE-1 downto 0);
    DNC_WRITE_HEADS_GW_OUT   : in std_logic_vector(DATA_SIZE-1 downto 0)
    );
end entity;

architecture model_write_heads_stimulus_architecture of model_write_heads_stimulus is

  ------------------------------------------------------------------------------
  -- Types
  ------------------------------------------------------------------------------

  ------------------------------------------------------------------------------
  -- Constants
  ------------------------------------------------------------------------------

  constant PERIOD : time := 10 ns;

  constant WAITING : time := 50 ns;
  constant WORKING : time := 1 ms;

  constant ZERO_CONTROL  : std_logic_vector(CONTROL_SIZE-1 downto 0) := std_logic_vector(to_unsigned(0, CONTROL_SIZE));
  constant ONE_CONTROL   : std_logic_vector(CONTROL_SIZE-1 downto 0) := std_logic_vector(to_unsigned(1, CONTROL_SIZE));
  constant TWO_CONTROL   : std_logic_vector(CONTROL_SIZE-1 downto 0) := std_logic_vector(to_unsigned(2, CONTROL_SIZE));
  constant THREE_CONTROL : std_logic_vector(CONTROL_SIZE-1 downto 0) := std_logic_vector(to_unsigned(3, CONTROL_SIZE));

  constant ZERO_DATA  : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(0, DATA_SIZE));
  constant ONE_DATA   : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(1, DATA_SIZE));
  constant TWO_DATA   : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(2, DATA_SIZE));
  constant THREE_DATA : std_logic_vector(DATA_SIZE-1 downto 0) := std_logic_vector(to_unsigned(3, DATA_SIZE));

  constant FULL  : std_logic_vector(DATA_SIZE-1 downto 0) := (others => '1');
  constant EMPTY : std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');

  constant EULER : std_logic_vector(DATA_SIZE-1 downto 0) := (others => '0');

  ------------------------------------------------------------------------------
  -- Signals
  ------------------------------------------------------------------------------

  -- LOOP
  signal index_i_loop : std_logic_vector(CONTROL_SIZE-1 downto 0);
  signal index_j_loop : std_logic_vector(CONTROL_SIZE-1 downto 0);
  signal index_k_loop : std_logic_vector(CONTROL_SIZE-1 downto 0);

  -- GLOBAL
  signal clk_int : std_logic;
  signal rst_int : std_logic;

  -- CONTROL
  signal start_int : std_logic;

begin

  ------------------------------------------------------------------------------
  -- Body
  ------------------------------------------------------------------------------

  -- clk generation
  clk_process : process
  begin
    clk_int <= '1';
    wait for PERIOD/2;

    clk_int <= '0';
    wait for PERIOD/2;
  end process;

  CLK <= clk_int;

  -- rst generation
  rst_process : process
  begin
    rst_int <= '0';
    wait for WAITING;

    rst_int <= '1';
    wait for WORKING;
  end process;

  RST <= rst_int;

  -- start generation
  start_process : process
  begin
    start_int <= '0';
    wait for WAITING;

    start_int <= '1';
    wait for PERIOD;

    start_int <= '0';
    wait for WORKING;
  end process;

  -- FUNCTIONALITY
  DNC_WRITE_HEADS_START <= start_int;

  ------------------------------------------------------------------------------
  -- STIMULUS
  ------------------------------------------------------------------------------

  main_test : process
  begin

    if (STIMULUS_DNC_WRITE_HEADS_TEST) then

      -------------------------------------------------------------------
      MONITOR_TEST <= "STIMULUS_DNC_WRITE_HEADS_TEST           ";
      -------------------------------------------------------------------

      -- DATA
      DNC_WRITE_HEADS_SIZE_S_IN <= THREE_CONTROL;
      DNC_WRITE_HEADS_SIZE_W_IN <= THREE_CONTROL;

      if (STIMULUS_DNC_WRITE_HEADS_CASE_0) then

        -------------------------------------------------------------------
        MONITOR_CASE <= "STIMULUS_DNC_WRITE_HEADS_CASE 0         ";
        -------------------------------------------------------------------

        -- INITIAL CONDITIONS
        -- DATA
        DNC_WRITE_HEADS_XI_IN <= ZERO_DATA;

        -- LOOP
        index_i_loop <= ZERO_CONTROL;

        WRITE_HEADS_FIRST_RUN : loop
          if (DNC_WRITE_HEADS_XI_OUT_ENABLE = '1' and (unsigned(index_i_loop) = unsigned(DNC_WRITE_HEADS_SIZE_W_IN)-unsigned(ONE_CONTROL))) then
            -- CONTROL
            DNC_WRITE_HEADS_XI_IN_ENABLE <= '1';

            -- DATA
            DNC_WRITE_HEADS_XI_IN <= VECTOR_SAMPLE_A(to_integer(unsigned(index_i_loop)));

            -- LOOP
            index_i_loop <= ZERO_CONTROL;
          elsif ((DNC_WRITE_HEADS_XI_OUT_ENABLE = '1' or DNC_WRITE_HEADS_START = '1') and (unsigned(index_i_loop) < unsigned(DNC_WRITE_HEADS_SIZE_W_IN)-unsigned(ONE_CONTROL))) then
            -- CONTROL
            DNC_WRITE_HEADS_XI_IN_ENABLE <= '1';

            -- DATA
            DNC_WRITE_HEADS_XI_IN <= VECTOR_SAMPLE_A(to_integer(unsigned(index_i_loop)));

            -- LOOP
            index_i_loop <= std_logic_vector(unsigned(index_i_loop) + unsigned(ONE_CONTROL));
          else
            -- CONTROL
            DNC_WRITE_HEADS_XI_IN_ENABLE <= '0';
          end if;

          -- GLOBAL
          wait until rising_edge(clk_int);

          -- CONTROL
          exit WRITE_HEADS_FIRST_RUN when DNC_WRITE_HEADS_READY = '1';
        end loop WRITE_HEADS_FIRST_RUN;
      end if;

      if (STIMULUS_DNC_WRITE_HEADS_CASE_1) then

        -------------------------------------------------------------------
        MONITOR_CASE <= "STIMULUS_DNC_WRITE_HEADS_CASE 1         ";
        -------------------------------------------------------------------

        -- INITIAL CONDITIONS
        -- DATA
        DNC_WRITE_HEADS_XI_IN <= ZERO_DATA;

        -- LOOP
        index_i_loop <= ZERO_CONTROL;

        WRITE_HEADS_SECOND_RUN : loop
          if ((DNC_WRITE_HEADS_XI_OUT_ENABLE = '1') and (unsigned(index_i_loop) = unsigned(DNC_WRITE_HEADS_SIZE_W_IN)-unsigned(ONE_CONTROL))) then
            -- CONTROL
            DNC_WRITE_HEADS_XI_IN_ENABLE <= '1';

            -- DATA
            DNC_WRITE_HEADS_XI_IN <= VECTOR_SAMPLE_B(to_integer(unsigned(index_i_loop)));

            -- LOOP
            index_i_loop <= ZERO_CONTROL;
          elsif (((DNC_WRITE_HEADS_XI_OUT_ENABLE = '1') or (DNC_WRITE_HEADS_START = '1')) and (unsigned(index_i_loop) < unsigned(DNC_WRITE_HEADS_SIZE_W_IN)-unsigned(ONE_CONTROL))) then
            -- CONTROL
            DNC_WRITE_HEADS_XI_IN_ENABLE <= '1';

            -- DATA
            DNC_WRITE_HEADS_XI_IN <= VECTOR_SAMPLE_B(to_integer(unsigned(index_i_loop)));

            -- LOOP
            index_i_loop <= std_logic_vector(unsigned(index_i_loop) + unsigned(ONE_CONTROL));
          else
            -- CONTROL
            DNC_WRITE_HEADS_XI_IN_ENABLE <= '0';
          end if;

          -- GLOBAL
          wait until rising_edge(clk_int);

          -- CONTROL
          exit WRITE_HEADS_SECOND_RUN when DNC_WRITE_HEADS_READY = '1';
        end loop WRITE_HEADS_SECOND_RUN;
      end if;

      wait for WORKING;

    end if;

    assert false
      report "END OF TEST"
      severity failure;

  end process main_test;

end architecture;
