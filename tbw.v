////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2003 Xilinx, Inc.
// All Right Reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 8.1i
//  \   \         Application : ISE
//  /   /         Filename : tbw.tfw
// /___/   /\     Timestamp : Sat Sep 12 21:58:27 2026
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: 
//Design Name: tbw
//Device: Xilinx
//
`timescale 1ns/1ps

module tbw;
    reg clk = 1'b0;
    reg we = 1'b0;
    reg [4:0] a = 5'b00000;
    reg [3:0] di = 4'b0000;
    wire [3:0] dataout;


    RAM UUT (
        .clk(clk),
        .we(we),
        .a(a),
        .di(di),
        .dataout(dataout));

    integer TX_FILE = 0;
    integer TX_ERROR = 0;
    
    initial begin  // Open the results file...
        TX_FILE = $fopen("results.txt");
        #2000 // Final time:  2000 ns
        if (TX_ERROR == 0) begin
            $display("No errors or warnings.");
            $fdisplay(TX_FILE, "No errors or warnings.");
        end else begin
            $display("%d errors found in simulation.", TX_ERROR);
            $fdisplay(TX_FILE, "%d errors found in simulation.", TX_ERROR);
        end
        $fclose(TX_FILE);
        $stop;
    end

    initial begin
        // -------------  Current Time:  100ns
        #100;
        clk = 1'b1;
        // -------------------------------------
        // -------------  Current Time:  200ns
        #100;
        clk = 1'b0;
        a = 5'b00101;
        di = 4'b0001;
        // -------------------------------------
        // -------------  Current Time:  300ns
        #100;
        clk = 1'b1;
        a = 5'b00111;
        di = 4'b1101;
        // -------------------------------------
        // -------------  Current Time:  400ns
        #100;
        clk = 1'b0;
        a = 5'b01110;
        // -------------------------------------
        // -------------  Current Time:  500ns
        #100;
        clk = 1'b1;
        we = 1'b1;
        a = 5'b01000;
        di = 4'b1110;
        // -------------------------------------
        // -------------  Current Time:  600ns
        #100;
        clk = 1'b0;
        we = 1'b0;
        di = 4'b0010;
        // -------------------------------------
        // -------------  Current Time:  700ns
        #100;
        clk = 1'b1;
        a = 5'b00001;
        // -------------------------------------
        // -------------  Current Time:  800ns
        #100;
        clk = 1'b0;
        a = 5'b10101;
        di = 4'b0000;
        // -------------------------------------
        // -------------  Current Time:  900ns
        #100;
        clk = 1'b1;
        a = 5'b11111;
        di = 4'b1001;
        // -------------------------------------
        // -------------  Current Time:  1000ns
        #100;
        clk = 1'b0;
        a = 5'b11110;
        // -------------------------------------
        // -------------  Current Time:  1100ns
        #100;
        clk = 1'b1;
        a = 5'b11010;
        di = 4'b1101;
        // -------------------------------------
        // -------------  Current Time:  1200ns
        #100;
        clk = 1'b0;
        di = 4'b0101;
        // -------------------------------------
        // -------------  Current Time:  1300ns
        #100;
        clk = 1'b1;
        we = 1'b1;
        a = 5'b10001;
        di = 4'b0110;
        // -------------------------------------
        // -------------  Current Time:  1400ns
        #100;
        clk = 1'b0;
        we = 1'b0;
        a = 5'b10101;
        // -------------------------------------
        // -------------  Current Time:  1500ns
        #100;
        clk = 1'b1;
        di = 4'b1010;
        // -------------------------------------
        // -------------  Current Time:  1600ns
        #100;
        clk = 1'b0;
        a = 5'b10010;
        di = 4'b1001;
        // -------------------------------------
        // -------------  Current Time:  1700ns
        #100;
        clk = 1'b1;
        a = 5'b11010;
        di = 4'b0001;
        // -------------------------------------
        // -------------  Current Time:  1800ns
        #100;
        clk = 1'b0;
        a = 5'b11000;
        di = 4'b0101;
        // -------------------------------------
        // -------------  Current Time:  1900ns
        #100;
        clk = 1'b1;
        di = 4'b1101;
    end

    task CHECK_dataout;
        input [3:0] NEXT_dataout;

        #0 begin
            if (NEXT_dataout !== dataout) begin
                $display("Error at time=%dns dataout=%b, expected=%b", $time, dataout, NEXT_dataout);
                $fdisplay(TX_FILE, "Error at time=%dns dataout=%b, expected=%b", $time, dataout, NEXT_dataout);
                $fflush(TX_FILE);
                TX_ERROR = TX_ERROR + 1;
            end
        end
    endtask

endmodule
