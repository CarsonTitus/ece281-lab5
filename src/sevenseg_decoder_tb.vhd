----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 09:24:04 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
--    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
--           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is
    component sevenseg_decoder is    
        port (i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
              o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
              );
    end component;
    
    signal i_Hex_tb : std_logic_vector (3 downto 0) := (others=> '0');
    signal o_seg_n_tb : std_logic_vector (6 downto 0);
    
begin
--    sevenseg_decoder_inst : sevenseg_decoder_tb port map (
      UUT: sevenseg_decoder
      port map (
                i_Hex => i_Hex_tb,
                o_seg_n => o_seg_n_tb
                );
                
      test_process: process
      begin
            i_Hex_tb <= x"0"; wait for 10 ns;
                assert o_seg_n_tb = "1000000" report "error on 0" severity failure;
            i_Hex_tb <= x"1"; wait for 10 ns;
                assert o_seg_n_tb = "1111001" report "error on 1" severity failure;
            i_Hex_tb <= x"2"; wait for 10 ns;
                assert o_seg_n_tb = "0100100" report "error on 2" severity failure;
            i_Hex_tb <= x"3"; wait for 10 ns;
                assert o_seg_n_tb = "0110000" report "error on 3" severity failure;
            i_Hex_tb <= x"4"; wait for 10 ns;
                assert o_seg_n_tb = "0011001" report "error on 4" severity failure;
            i_Hex_tb <= x"5"; wait for 10 ns;
                assert o_seg_n_tb = "0010010" report "error on 5" severity failure;
            i_Hex_tb <= x"6"; wait for 10 ns;
                assert o_seg_n_tb = "0000010" report "error on 6" severity failure;
            i_Hex_tb <= x"7"; wait for 10 ns;
                assert o_seg_n_tb = "1111000" report "error on 7" severity failure;
            i_Hex_tb <= x"8"; wait for 10 ns;
                assert o_seg_n_tb = "0000000" report "error on 8" severity failure;
            i_Hex_tb <= x"9"; wait for 10 ns;
                assert o_seg_n_tb = "0011000" report "error on 9" severity failure;
            i_Hex_tb <= x"A"; wait for 10 ns;
                assert o_seg_n_tb = "0001000" report "error on A" severity failure;
            i_Hex_tb <= x"B"; wait for 10 ns;
                assert o_seg_n_tb = "0000011" report "error on b" severity failure;
            i_Hex_tb <= x"C"; wait for 10 ns;
                assert o_seg_n_tb = "0100111" report "error on c" severity failure;
            i_Hex_tb <= x"D"; wait for 10 ns;
                assert o_seg_n_tb = "0100001" report "error on d" severity failure;
            i_Hex_tb <= x"E"; wait for 10 ns;
                assert o_seg_n_tb = "0000110" report "error on e" severity failure;
            i_Hex_tb <= x"F"; wait for 10 ns;
                assert o_seg_n_tb = "0001110" report "error on f" severity failure;
            
            wait; -- forever
    end process;

end Behavioral;
