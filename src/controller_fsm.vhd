----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:42:49 PM
-- Design Name: 
-- Module Name: controller_fsm - FSM
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller_fsm is
    Port ( i_reset : in STD_LOGIC;
           i_adv : in STD_LOGIC;
           o_cycle : out STD_LOGIC_VECTOR (3 downto 0));
end controller_fsm;

architecture FSM of controller_fsm is
    signal state : STD_LOGIC_VECTOR(3 downto 0) := "0001";
    signal prev  : STD_LOGIC := '0';
begin
    process (i_adv, i_reset)
    begin
        if i_reset = '1' then
            state <= "0001"; -- reset state
            prev <= '0';
        elsif i_adv = '1' AND prev = '0' then
            if state = "0001" then 
                state <= "0010"; -- operand 1
            elsif state = "0010" then
                state <= "0100"; -- operand 2
            elsif state = "0100" then
                state <= "1000"; -- complete the step
            else 
                state <= "0001"; -- reset state
            end if;
            prev <= '1';
        elsif i_adv = '0' then 
            prev <= '0';
        end if;
    end process;
    
    o_cycle <= state;

end FSM;
