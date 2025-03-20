with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO;

procedure Calculator is
    Left_Operand, Right_Operand, Result : Float;
    Operator : Character;
    Input_Line : Unbounded_String;
begin
    loop
        Put_Line("x + y veya çıkış için 'exit' yazın:");
        declare use Ada.Strings.Unbounded.Text_IO; begin Get_Line(Input_Line); end;
        
        if To_String(Input_Line) = "exit" then exit; end if;
        
        declare
            Words : constant String := To_String(Input_Line);
            Space_Index_1, Space_Index_2 : Integer;
        begin
            Space_Index_1 := Index(Words, " ", 1);
            Space_Index_2 := Index(Words, " ", Space_Index_1 + 1);
            
            if Space_Index_1 = 0 or Space_Index_2 = 0 then
                Put_Line("Hata!");
                cycle;
            end if;

            begin
                Left_Operand := Float'Value(Words(1 .. Space_Index_1 - 1));
                Operator := Words(Space_Index_1 + 1);
                Right_Operand := Float'Value(Words(Space_Index_2 + 1 .. Words'Length));
            exception
                when others => Put_Line("Hata!"); cycle;
            end;

            case Operator is
                when '+' => Result := Left_Operand + Right_Operand;
                when '-' => Result := Left_Operand - Right_Operand;
                when '*' => Result := Left_Operand * Right_Operand;
                when '/' =>
                    if Right_Operand = 0.0 then Put_Line("0'a bölünemez!"); cycle; end if;
                    Result := Left_Operand / Right_Operand;
                when others => Put_Line("Hata!"); cycle;
            end case;
            
            Put_Line(Float'Image(Result));
        end;
    end loop;
end Calculator;
