# -*- coding: utf-8 -*-

def _():
    from IPython.terminal.prompts import Prompts, Token
    from prompt_toolkit.key_binding.vi_state import InputMode

    class MyPrompts(Prompts):

        def in_prompt_tokens(self, app=None):
            app = self.shell.pt_app.app
            mode = '+' if app.vi_state.input_mode == InputMode.INSERT else ':'
            return [
                (Token.ViMode, mode),
                (Token.Prompt, 'In ['),
                (Token.PromptNum, str(self.shell.execution_count)),
                (Token.Prompt, ']: '),
            ]

    ip = get_ipython()
    ip.prompts = MyPrompts(ip)


_()
del _
