--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2013 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file cic.vhd when simulating
-- the core, cic. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY cic IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC
  );
END cic;

ARCHITECTURE cic_a OF cic IS
-- synthesis translate_off
COMPONENT wrapped_cic
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_cic USE ENTITY XilinxCoreLib.cic_compiler_v3_0(behavioral)
    GENERIC MAP (
      C_C1 => 22,
      C_C2 => 22,
      C_C3 => 22,
      C_C4 => 22,
      C_C5 => 22,
      C_C6 => 0,
      C_CLK_FREQ => 1,
      C_COMPONENT_NAME => "cic",
      C_DIFF_DELAY => 1,
      C_FAMILY => "artix7",
      C_FILTER_TYPE => 1,
      C_HAS_ACLKEN => 0,
      C_HAS_ARESETN => 0,
      C_HAS_DOUT_TREADY => 0,
      C_HAS_ROUNDING => 0,
      C_I1 => 22,
      C_I2 => 22,
      C_I3 => 22,
      C_I4 => 22,
      C_I5 => 22,
      C_I6 => 0,
      C_INPUT_WIDTH => 2,
      C_MAX_RATE => 16,
      C_MIN_RATE => 16,
      C_M_AXIS_DATA_TDATA_WIDTH => 24,
      C_M_AXIS_DATA_TUSER_WIDTH => 1,
      C_NUM_CHANNELS => 1,
      C_NUM_STAGES => 5,
      C_OUTPUT_WIDTH => 22,
      C_RATE => 16,
      C_RATE_TYPE => 0,
      C_SAMPLE_FREQ => 1,
      C_S_AXIS_CONFIG_TDATA_WIDTH => 1,
      C_S_AXIS_DATA_TDATA_WIDTH => 8,
      C_USE_DSP => 1,
      C_USE_STREAMING_INTERFACE => 1,
      C_XDEVICEFAMILY => "artix7"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_cic
  PORT MAP (
    aclk => aclk,
    s_axis_data_tdata => s_axis_data_tdata,
    s_axis_data_tvalid => s_axis_data_tvalid,
    s_axis_data_tready => s_axis_data_tready,
    m_axis_data_tdata => m_axis_data_tdata,
    m_axis_data_tvalid => m_axis_data_tvalid
  );
-- synthesis translate_on

END cic_a;
