page 50103 "Bonus Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bonus Line";
    
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of the bonus assigned';         
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies item number for which bonus is assigned';
                }
                field("Bonus Perc."; Rec."Bonus Perc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus percent';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}