def format: 
  .type + " " + .name? + "..." + .event, 
  if .type == "suite" and .event != "started" then "\n", {passed, failed, ignored, measured, filtered_out} else "" end,
  "\n";

def main:
  if .stdout? != null then 
    if .stdout | contains("unsupported Miri functionality") or contains("unsupported operation") then
      .event |= "unsupported" | format
    else 
      format, .stdout
    end
  else
    format
  end;
