//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved	                               
//----------------------------------------------------------------------------------------
// File name:           tb_touch_led
// Last modified Date:  2018年5月8日21:00:26
// Last Version:        v1.0
// Descriptions:        触摸板控制led灯测试
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018年5月8日21:00:38
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
// Modified by:		    正点原子
// Modified date:	    
// Version:			    
// Descriptions:	    
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
`timescale 1ns/1ns
module tb_touch_led();

//parameter define
parameter   T =20 ;

//reg define
reg sys_clk;
reg sys_rst_n;
reg touch_key;

//wire define
wire led;

//*****************************************************
//**                    main code
//*****************************************************

//给输入信号初始值
initial begin
    sys_clk              <=1'b0;
    sys_rst_n            <=1'b0;
    touch_key            <=1'b0;
    #20  sys_rst_n       <=1'b1;
    #10  touch_key       <=1'b1;
    #30  touch_key       <=1'b0; 
    #110 touch_key       <=1'b1;
    #30  touch_key       <=1'b0;
end
   
//50Mhz的时钟，周期则为1/50Mhz=20ns,所以每10ns，电平取反一次
always # (T/2) sys_clk <= ~sys_clk;

touch_led  u0(
.sys_clk(sys_clk),
.sys_rst_n(sys_rst_n),
.touch_key(touch_key),
.led(led)
);
endmodule      