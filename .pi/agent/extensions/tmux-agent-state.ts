import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";

const hook = `${process.env.HOME}/.local/bin/tmux-agent-state`;

export default function (pi: ExtensionAPI) {
	if (!process.env.TMUX_PANE) return;

	// Handlers for different events can overlap, and the pane state must follow event order.
	let queue = Promise.resolve();

	const report = (event: string) => (_event: unknown, ctx: ExtensionContext) => {
		const session = ctx.sessionManager.getSessionFile() ?? "";
		queue = queue.then(() => pi.exec(hook, ["pi", event, session]).then(() => {}, () => {}));
		return queue;
	};

	pi.on("session_start", report("session_start"));
	pi.on("agent_start", report("agent_start"));
	pi.on("agent_settled", report("agent_settled"));
	pi.on("ui_prompt_start", report("ui_prompt_start"));
	pi.on("ui_prompt_end", report("ui_prompt_end"));
	pi.on("session_shutdown", report("session_shutdown"));
}
