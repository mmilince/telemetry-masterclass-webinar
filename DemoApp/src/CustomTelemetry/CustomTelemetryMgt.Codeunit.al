codeunit 70102 "RM Custom Telemetry Mgt"
{
    procedure LogCustomTelemetry(StartTime: DateTime)
    var
        LogDict: Dictionary of [Text, Text];
        Msg: Text;
        WaitingTime: Duration;
        DurationMs: Integer;
    begin
        WaitingTime := CurrentDateTime() - StartTime;
        DurationMs := WaitingTime;

        LogDict.Add('Custom_TenantId', Database.TenantId());
        LogDict.Add('Custom_CompanyName', CompanyName());
        LogDict.Add('Custom_WaitingDuration', Format(DurationMs, 0, 9));

        Msg := StrSubstNo('Company:%1, Tenant: %2, Duration: %3', CompanyName(), Database.TenantId(), Format(DurationMs, 0, 9));
        Session.LogMessage('CUSTOM0001', 'Custom Telemetry Message Waiting: ' + Msg, Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::All, LogDict);
    end;
}