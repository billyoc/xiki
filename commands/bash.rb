# /, so tell them to run stuff

if args == []
  return "
    | # Put some bash code here to run it
    | echo 'something'
    | echo 'something else'
    "
end

# tasks+, so show items

return "~ exit and run" if task == []

if task == ["exit and run"]
  Xsh.save_grab_commands args[0]
  return DiffLog.quit
end

# /code, so run it

txt = args[0]
File.open("/tmp/bash.sh", "w") { |f| f << txt }
txt = Shell.command "bash /tmp/bash.sh"#, :stdin=>"foo"
Tree.quote txt

