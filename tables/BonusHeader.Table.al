table 50101 "Bonus Header"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus';
    DrillDownPageId = "Bonus List";
    LookupPageId = "Bonus List";
    
    fields
    {
        field(1;"No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';  

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    BonusSetup.Get();
                    NoSeriesMgmt.TestManual(BonusSetup."Bonus Nos.");
                    "No. Series" := '';
                end;
            end;       
        }

        field(2; "Customer No."; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(4; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
        } 
        field(5; "Status"; Enum "Bonus Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(100; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            // This is a look up to the number series table
        }
                 
    }
    
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        BonusSetup: Record "Bonus Setup";
        NoSeriesMgmt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            BonusSetup.Get();
            BonusSetup.TestField("Bonus Nos.");
            NoSeriesMgmt.InitSeries(BonusSetup."Bonus Nos.", xRec."No.", 0D, Rec."No.",Rec."No. Series");
        end;
    end;
}