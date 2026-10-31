-- Leader key: ctrl+a, then one key, as in ~/.tmux.conf. The leader mode ends after one key.
rex.mode("leader")
rex.bind("ctrl+a", "client.mode.enter", { name = "leader", once = true })

-- Splits: leader | puts the new pane on the right, leader - puts it below.
rex.bind("leader/shift+\\", "pane.split.right")
rex.bind("leader/-", "pane.split.down")

-- Move between splits: leader h / j / k / l
rex.bind("leader/h", "pane.focus.left")
rex.bind("leader/j", "pane.focus.down")
rex.bind("leader/k", "pane.focus.up")
rex.bind("leader/l", "pane.focus.right")

-- Tabs, counted from 0: leader 0 is the first tab, leader 9 is the tenth.
-- client.tab.goto counts from 1, so add 1.
for i = 0, 9 do
  rex.bind("leader/" .. i, "client.tab.goto", { index = i + 1 })
end

-- Zoom the pane: leader z (the tmux default for zoom)
rex.bind("leader/z", "pane.zoom")

-- New tab: leader c (the tmux default for new-window)
rex.bind("leader/c", "client.tab.new")

-- Mark the tab unread and go to the previous tab: leader u. Rex has no unread
-- action, so this reports a "done" program status to the tab's terminal, the
-- same mark a finished program leaves. Rex removes it when you go back to the
-- tab and type. The status is sent after the switch, because Rex counts a
-- status that arrives in the open tab as already seen.
rex.action{
  name  = "mark_unread",
  title = "Mark Tab Unread",
  run   = function(ctx)
    local p = rex.block.call("com.superlogical.terminal", "process", { block_id = ctx.block_id })
    local tty = rex.exec({ "ps", "-o", "tty=", "-p", tostring(p.child.pid) }).stdout:gsub("%s", "")
    rex.client.queue("client.tab.previous")
    rex.exec.start({ "sh", "-c", 'sleep 0.3; printf "\\033]7501;state=done:app=unread\\007" > "/dev/$1"', "sh", tty }, { detach = true })
  end,
}
rex.bind("leader/u", "mark_unread")

-- Rename the tab: leader , (the tmux default for rename-window)
rex.bind("leader/,", "client.tab.rename")

-- Session picker: leader s (the tmux default for choose-tree)
rex.bind("leader/s", "session.switch")
