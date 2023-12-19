table 70100 "RM Feature Setup"
{
    Access = Internal;
    Caption = 'Feature Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Enabled; Boolean)
        {
            Caption = 'Enabled';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                ValidateEnabled();
            end;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; "Some Setup Field"; Text[250])
        {
            Caption = 'Some Setup Field';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    var
        TelemetryFeatureMgt: Codeunit "RM Telemetry Feature Mgt.";
    begin
        if (Rec.Description <> xRec.Description) or (Rec."Some Setup Field" <> xRec."Some Setup Field") then
            TelemetryFeatureMgt.SetUpDemoFeature();
    end;

    local procedure ValidateEnabled()
    var
        TelemetryFeatureMgt: Codeunit "RM Telemetry Feature Mgt.";
    begin
        if Rec.Enabled = xRec.Enabled then
            exit;

        if Rec.Enabled then
            TelemetryFeatureMgt.DiscoverDemoFeature()
        else
            TelemetryFeatureMgt.UndiscoverDemoFeature();
    end;
}