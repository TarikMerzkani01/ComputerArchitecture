   `timescale 1ns/100ps
//
// Test Bench for the mips alu
// T. Posbergh, 14 October 2012
//
   `include "MIPSALU.v"
//
module test_mipsalu;
   wire Zero;             // ALU bit output
   wire [31:0] ALUOut;    // ALU word output
   reg  [31:0] A,B;       // ALU word inpus
   reg  [3:0]  ALUctl;

   reg clock;
   reg reset;

// instantiate the alu and control

   MIPSALU U0(ALUctl, A, B, ALUOut, Zero);

// generate test signals

   initial 
   begin
      A=32'b0000_0000_0000_0000_0000_0000_1111_1110;
      B=32'b0000_0000_0000_0000_0000_0000_1111_0000;
      #10 ALUctl=4'b0000;
      #10 ALUctl=4'b0001;
      #10 ALUctl=4'b0010;
      #10 ALUctl=4'b0110;
//    $finish(100);
      #10 $finish;
    end

// output result

   initial
      $monitor($time, " A = %h",A," B = %h",B," ALUOut = %h",ALUOut," Zero = %b",Zero);

// the following generates vcd file for GTKwave
   initial
      begin
      $dumpfile("MIPSAlu.vcd");
      $dumpvars;
   end

endmodule


