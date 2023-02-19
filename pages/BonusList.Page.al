page 50101 "Bonus List"
{
    Caption = 'Bonuses';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Bonus Header";
    Editable = false;
    CardPageId = "Bonus Card";
    
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No"; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus number';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the starting date';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the starting date';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus status';
                }
            }
        }

    }
    
    actions
    {
        area(Navigation) 
        // Navigation action is used to open related data
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
                ToolTip = 'Opens customer card';
            }

            action(BonusEntries)
            {
                ApplicationArea = All;
                Caption = 'Bonus Entries';
                Image = Entry;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
                ToolTip = 'Open bonus entries';
            }
        }
    }
}