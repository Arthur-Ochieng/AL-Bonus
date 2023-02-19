tableextension 50100 CustomerExtension extends Customer
{
    fields
    {
        field(50100; "Bonuses"; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = Flowfield;
            CalcFormula = count("Bonus Header" where ("Customer No." = field("No.")));
            Editable = false;
        }     
    }
    
    // Do not allow the customer record to be deleted it if they have a record in the Bonus
    var 
        BonusExistErr: Label 'You cannot delete customer %1 because there is at least one record available';

    trigger OnBeforeDelete()
    var
        BonusHeader: Record "Bonus Header";
        begin
            BonusHeader.SetRange("Customer No.", "No.");
            if not BonusHeader.IsEmpty() then
                Error(BonusExistErr, "No.");
        end; 
}