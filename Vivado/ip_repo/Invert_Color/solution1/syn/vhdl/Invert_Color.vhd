-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Invert_Color is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    in_data_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    in_data_TVALID : IN STD_LOGIC;
    in_data_TREADY : OUT STD_LOGIC;
    in_data_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
    in_data_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
    in_data_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    in_data_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    out_data_TDATA : OUT STD_LOGIC_VECTOR (23 downto 0);
    out_data_TVALID : OUT STD_LOGIC;
    out_data_TREADY : IN STD_LOGIC;
    out_data_TKEEP : OUT STD_LOGIC_VECTOR (2 downto 0);
    out_data_TSTRB : OUT STD_LOGIC_VECTOR (2 downto 0);
    out_data_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    out_data_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0) );
end;


architecture behav of Invert_Color is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "Invert_Color_Invert_Color,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=4.721000,HLS_SYN_LAT=2,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=167,HLS_SYN_LUT=265,HLS_VERSION=2020_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";

    signal ap_rst_n_inv : STD_LOGIC;
    signal a : STD_LOGIC_VECTOR (31 downto 0);
    signal a_0_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal a_0_vld_reg : STD_LOGIC := '0';
    signal a_0_ack_out : STD_LOGIC;
    signal col : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal in_data_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal out_data_TDATA_blk_n : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal tmp_i1_keep_reg_234 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal regslice_both_out_data_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal tmp_i1_strb_reg_239 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_i1_user_reg_244 : STD_LOGIC_VECTOR (0 downto 0);
    signal curr_pixel_last_V_reg_249 : STD_LOGIC_VECTOR (0 downto 0);
    signal v_p1_V_fu_133_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal v_p1_V_reg_254 : STD_LOGIC_VECTOR (7 downto 0);
    signal v_p2_V_reg_260 : STD_LOGIC_VECTOR (7 downto 0);
    signal v_p3_V_reg_266 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal select_ln55_fu_167_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal add_ln55_fu_161_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln43_fu_181_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_2_fu_197_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal r_1_fu_192_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal r_fu_187_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal out3_V_fu_202_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal out2_V_fu_209_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal out1_V_fu_216_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal regslice_both_in_data_V_data_V_U_apdone_blk : STD_LOGIC;
    signal in_data_TDATA_int_regslice : STD_LOGIC_VECTOR (23 downto 0);
    signal in_data_TVALID_int_regslice : STD_LOGIC;
    signal in_data_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_in_data_V_data_V_U_ack_in : STD_LOGIC;
    signal regslice_both_in_data_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal in_data_TKEEP_int_regslice : STD_LOGIC_VECTOR (2 downto 0);
    signal regslice_both_in_data_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_in_data_V_keep_V_U_ack_in : STD_LOGIC;
    signal regslice_both_in_data_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal in_data_TSTRB_int_regslice : STD_LOGIC_VECTOR (2 downto 0);
    signal regslice_both_in_data_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_in_data_V_strb_V_U_ack_in : STD_LOGIC;
    signal regslice_both_in_data_V_user_V_U_apdone_blk : STD_LOGIC;
    signal in_data_TUSER_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_in_data_V_user_V_U_vld_out : STD_LOGIC;
    signal regslice_both_in_data_V_user_V_U_ack_in : STD_LOGIC;
    signal regslice_both_in_data_V_last_V_U_apdone_blk : STD_LOGIC;
    signal in_data_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_in_data_V_last_V_U_vld_out : STD_LOGIC;
    signal regslice_both_in_data_V_last_V_U_ack_in : STD_LOGIC;
    signal out_data_TDATA_int_regslice : STD_LOGIC_VECTOR (23 downto 0);
    signal out_data_TVALID_int_regslice : STD_LOGIC;
    signal out_data_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_out_data_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_data_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_out_data_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_data_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_data_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_out_data_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_data_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_data_V_user_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_out_data_V_user_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_data_V_user_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_data_V_last_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_out_data_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_data_V_last_V_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component Invert_Color_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        a : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component Invert_Color_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    control_s_axi_U : component Invert_Color_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        a => a);

    regslice_both_in_data_V_data_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 24)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_data_TDATA,
        vld_in => in_data_TVALID,
        ack_in => regslice_both_in_data_V_data_V_U_ack_in,
        data_out => in_data_TDATA_int_regslice,
        vld_out => in_data_TVALID_int_regslice,
        ack_out => in_data_TREADY_int_regslice,
        apdone_blk => regslice_both_in_data_V_data_V_U_apdone_blk);

    regslice_both_in_data_V_keep_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 3)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_data_TKEEP,
        vld_in => in_data_TVALID,
        ack_in => regslice_both_in_data_V_keep_V_U_ack_in,
        data_out => in_data_TKEEP_int_regslice,
        vld_out => regslice_both_in_data_V_keep_V_U_vld_out,
        ack_out => in_data_TREADY_int_regslice,
        apdone_blk => regslice_both_in_data_V_keep_V_U_apdone_blk);

    regslice_both_in_data_V_strb_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 3)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_data_TSTRB,
        vld_in => in_data_TVALID,
        ack_in => regslice_both_in_data_V_strb_V_U_ack_in,
        data_out => in_data_TSTRB_int_regslice,
        vld_out => regslice_both_in_data_V_strb_V_U_vld_out,
        ack_out => in_data_TREADY_int_regslice,
        apdone_blk => regslice_both_in_data_V_strb_V_U_apdone_blk);

    regslice_both_in_data_V_user_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_data_TUSER,
        vld_in => in_data_TVALID,
        ack_in => regslice_both_in_data_V_user_V_U_ack_in,
        data_out => in_data_TUSER_int_regslice,
        vld_out => regslice_both_in_data_V_user_V_U_vld_out,
        ack_out => in_data_TREADY_int_regslice,
        apdone_blk => regslice_both_in_data_V_user_V_U_apdone_blk);

    regslice_both_in_data_V_last_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_data_TLAST,
        vld_in => in_data_TVALID,
        ack_in => regslice_both_in_data_V_last_V_U_ack_in,
        data_out => in_data_TLAST_int_regslice,
        vld_out => regslice_both_in_data_V_last_V_U_vld_out,
        ack_out => in_data_TREADY_int_regslice,
        apdone_blk => regslice_both_in_data_V_last_V_U_apdone_blk);

    regslice_both_out_data_V_data_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 24)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => out_data_TDATA_int_regslice,
        vld_in => out_data_TVALID_int_regslice,
        ack_in => out_data_TREADY_int_regslice,
        data_out => out_data_TDATA,
        vld_out => regslice_both_out_data_V_data_V_U_vld_out,
        ack_out => out_data_TREADY,
        apdone_blk => regslice_both_out_data_V_data_V_U_apdone_blk);

    regslice_both_out_data_V_keep_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 3)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => tmp_i1_keep_reg_234,
        vld_in => out_data_TVALID_int_regslice,
        ack_in => regslice_both_out_data_V_keep_V_U_ack_in_dummy,
        data_out => out_data_TKEEP,
        vld_out => regslice_both_out_data_V_keep_V_U_vld_out,
        ack_out => out_data_TREADY,
        apdone_blk => regslice_both_out_data_V_keep_V_U_apdone_blk);

    regslice_both_out_data_V_strb_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 3)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => tmp_i1_strb_reg_239,
        vld_in => out_data_TVALID_int_regslice,
        ack_in => regslice_both_out_data_V_strb_V_U_ack_in_dummy,
        data_out => out_data_TSTRB,
        vld_out => regslice_both_out_data_V_strb_V_U_vld_out,
        ack_out => out_data_TREADY,
        apdone_blk => regslice_both_out_data_V_strb_V_U_apdone_blk);

    regslice_both_out_data_V_user_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => tmp_i1_user_reg_244,
        vld_in => out_data_TVALID_int_regslice,
        ack_in => regslice_both_out_data_V_user_V_U_ack_in_dummy,
        data_out => out_data_TUSER,
        vld_out => regslice_both_out_data_V_user_V_U_vld_out,
        ack_out => out_data_TREADY,
        apdone_blk => regslice_both_out_data_V_user_V_U_apdone_blk);

    regslice_both_out_data_V_last_V_U : component Invert_Color_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => curr_pixel_last_V_reg_249,
        vld_in => out_data_TVALID_int_regslice,
        ack_in => regslice_both_out_data_V_last_V_U_ack_in_dummy,
        data_out => out_data_TLAST,
        vld_out => regslice_both_out_data_V_last_V_U_vld_out,
        ack_out => out_data_TREADY,
        apdone_blk => regslice_both_out_data_V_last_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    a_0_vld_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_const_logic_1 = a_0_ack_out) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = a_0_vld_reg)) or ((ap_const_logic_0 = a_0_vld_reg) and (ap_const_logic_1 = ap_const_logic_1)))) then
                a_0_data_reg <= a;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                col <= select_ln55_fu_167_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                curr_pixel_last_V_reg_249 <= in_data_TLAST_int_regslice;
                tmp_i1_keep_reg_234 <= in_data_TKEEP_int_regslice;
                tmp_i1_strb_reg_239 <= in_data_TSTRB_int_regslice;
                tmp_i1_user_reg_244 <= in_data_TUSER_int_regslice;
                v_p1_V_reg_254 <= v_p1_V_fu_133_p1;
                v_p2_V_reg_260 <= in_data_TDATA_int_regslice(15 downto 8);
                v_p3_V_reg_266 <= in_data_TDATA_int_regslice(23 downto 16);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;

    a_0_ack_out_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            a_0_ack_out <= ap_const_logic_1;
        else 
            a_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;

    add_ln55_fu_161_p2 <= std_logic_vector(unsigned(col) + unsigned(ap_const_lv32_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, regslice_both_out_data_V_data_V_U_apdone_blk, in_data_TVALID_int_regslice, out_data_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((out_data_TREADY_int_regslice = ap_const_logic_0) or (regslice_both_out_data_V_data_V_U_apdone_blk = ap_const_logic_1))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (out_data_TREADY_int_regslice = ap_const_logic_0)) or ((ap_const_logic_1 = ap_const_logic_1) and (in_data_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, regslice_both_out_data_V_data_V_U_apdone_blk, in_data_TVALID_int_regslice, out_data_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((out_data_TREADY_int_regslice = ap_const_logic_0) or (regslice_both_out_data_V_data_V_U_apdone_blk = ap_const_logic_1))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (out_data_TREADY_int_regslice = ap_const_logic_0)) or ((ap_const_logic_1 = ap_const_logic_1) and (in_data_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, regslice_both_out_data_V_data_V_U_apdone_blk, in_data_TVALID_int_regslice, out_data_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((out_data_TREADY_int_regslice = ap_const_logic_0) or (regslice_both_out_data_V_data_V_U_apdone_blk = ap_const_logic_1))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (out_data_TREADY_int_regslice = ap_const_logic_0)) or ((ap_const_logic_1 = ap_const_logic_1) and (in_data_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(in_data_TVALID_int_regslice)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (in_data_TVALID_int_regslice = ap_const_logic_0);
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(out_data_TREADY_int_regslice)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (out_data_TREADY_int_regslice = ap_const_logic_0);
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(regslice_both_out_data_V_data_V_U_apdone_blk, out_data_TREADY_int_regslice)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((out_data_TREADY_int_regslice = ap_const_logic_0) or (regslice_both_out_data_V_data_V_U_apdone_blk = ap_const_logic_1));
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_reset_idle_pp0 <= ap_const_logic_0;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    icmp_ln43_fu_181_p2 <= "1" when (a_0_data_reg = ap_const_lv32_1) else "0";

    in_data_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, in_data_TVALID_int_regslice)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            in_data_TDATA_blk_n <= in_data_TVALID_int_regslice;
        else 
            in_data_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    in_data_TREADY <= regslice_both_in_data_V_data_V_U_ack_in;

    in_data_TREADY_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            in_data_TREADY_int_regslice <= ap_const_logic_1;
        else 
            in_data_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    out1_V_fu_216_p3 <= 
        r_fu_187_p2 when (icmp_ln43_fu_181_p2(0) = '1') else 
        v_p1_V_reg_254;
    out2_V_fu_209_p3 <= 
        r_1_fu_192_p2 when (icmp_ln43_fu_181_p2(0) = '1') else 
        v_p2_V_reg_260;
    out3_V_fu_202_p3 <= 
        r_2_fu_197_p2 when (icmp_ln43_fu_181_p2(0) = '1') else 
        v_p3_V_reg_266;

    out_data_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, out_data_TREADY_int_regslice)
    begin
        if ((((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            out_data_TDATA_blk_n <= out_data_TREADY_int_regslice;
        else 
            out_data_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    out_data_TDATA_int_regslice <= ((out3_V_fu_202_p3 & out2_V_fu_209_p3) & out1_V_fu_216_p3);
    out_data_TVALID <= regslice_both_out_data_V_data_V_U_vld_out;

    out_data_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            out_data_TVALID_int_regslice <= ap_const_logic_1;
        else 
            out_data_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    r_1_fu_192_p2 <= (v_p2_V_reg_260 xor ap_const_lv8_FF);
    r_2_fu_197_p2 <= (v_p3_V_reg_266 xor ap_const_lv8_FF);
    r_fu_187_p2 <= (v_p1_V_reg_254 xor ap_const_lv8_FF);
    select_ln55_fu_167_p3 <= 
        ap_const_lv32_1 when (in_data_TLAST_int_regslice(0) = '1') else 
        add_ln55_fu_161_p2;
    v_p1_V_fu_133_p1 <= in_data_TDATA_int_regslice(8 - 1 downto 0);
end behav;
