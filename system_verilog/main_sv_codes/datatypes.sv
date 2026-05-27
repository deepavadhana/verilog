// Code your design here
module datatype_sv;
  int a=6;
  integer b=-13;
  shortint c=16;
  longint d=1234567890;
  bit [3:0] e=4'b0110;
  byte ascii="A";
  logic [3:0] f=4'b0001;
  reg [3:0] reg_data=4'b0011;
  time current_time;
  real pi=3.14159;
  shortreal temp=27.8;
  realtime delay_time=67.88;
  string name="Vadhana";
  event ready_data;
  const int MAX=50;
  typedef int def_enum;
  def_enum x=100;
  enum{RED,GREEN,YELLOW}signal;
  initial begin
    signal = GREEN;
    current_time = $time;
    -> ready_data;
     $display("int a = %0d",a);
    $display("integer b = %0d",b);
    $display("shortint c = %0d",c);
    $display("longint d = %0d",d);
    $display("bit_data e = %0b",e);
    $display("byte ascii = %s",ascii);
    $display("logic f = %0b",f);
    $display("reg reg_data = %0b",reg_data);
    $display("real pi= %0d",pi);
    $display("string name = %s", name);
    $display("typedef x = %0d", x);
    $display("enum signal = %0d", signal);
    $display("constant MAX = %0d", MAX);
  end
   function void display_message();
        $display("This is a void function");
    endfunction

   endmodule


