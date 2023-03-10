page 50100 "Bonus Setup"
{
    Caption = 'Bonus Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bonus Setup";
    DeleteAllowed = false;
    InsertAllowed = false;
    
    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Bonus Nos."; Rec."Bonus Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies number series that will be used for bonus numbers';
                }
                
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.reset();

        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
            // You insert the empty field for the primary key
        end;
    end;
    
}