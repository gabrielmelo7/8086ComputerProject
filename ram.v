module ram
#(
  parameter add_size = 11,
  parameter data_size = 8
)
(
  input clk,
  input rst,
  
  input write_en,
  input [add_size-1:0] write_adress,
  input [data_size-1:0] data_in,
  
  input rd_en,
  input [add_size-1:0] rd_adress,
  output reg [data_size-1:0] data_out
);

// Declaração da Memória:
reg [data_size-1:0] ram [0:4095];

always @(posedge clk) begin
  if (rst)
    data_out <= 0; // Resetando saída
  else begin
    if (write_en)
      ram[write_adress] <= data_in;
    if (rd_en)
      data_out <= ram[rd_adress];
  end
end

endmodule