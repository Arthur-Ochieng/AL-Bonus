pageextension 50100 CustomerList extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("Bonuses"; Rec."Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Shows number of assigned bonuses to the customers';
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action(MNBBonuses)
            {
                Caption = 'Bonuses';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "Bonus List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }

}