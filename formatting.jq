def format: 
  "miri: " .type + " " + .name? + "..." + .event, 
  if .type == "suite" and .event != "started" then "\n", {passed, failed, ignored, measured, filtered_out} else "" end,
  "\n";

def main:
  if .stdout? != null then 
    if .stdout | contains("unsupported Miri functionality") then
      .event |= "unsupported" | format
    else 
      format, .stdout
    end
  else
    format
  end;