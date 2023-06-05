```Python
from dingtalkchatbot.chatbot import DingtalkChatbot, CardItem, ActionCard



class dd_bot:
    def __init__(self, webhook, secert):
        self.bot = DingtalkChatbot(webhook, secert)
        # 用于发送文本内容
        self.send_text = self.bot.send_text
        # 用于发送图片
        self.send_img = self.bot.send_image
        # 用于发送链接
        self.send_link = self.bot.send_link
        # 用于发送markdown
        self.send_md = self.bot.send_markdown
	
    # 用于发送卡片
    def send_card(self, Card_List):
        cards = [CardItem(**Card) for Card in Card_List]
        self.bot.send_feed_card(cards)
	
    # 用于发送单按钮或多按钮卡片
    def send_action_card(self, Btn_List, Action):
        if not isinstance(Btn_List, list or tuple):
            btns = [CardItem(**Btn_List[0])]
        else:
            btns = [CardItem(**Btn) for Btn in Btn_List]

        actioncard = ActionCard(title=Action.get('title'),
                                text=Action.get('text'),
                                btns=btns,
                                btn_orientation=1,
                                hide_avatar=1)

        self.bot.send_action_card(actioncard)


        

webhook = 'xxxxx'
secert = 'xxxxx'
# 得到bot对象
bot_obj = dd_bot(webhook, secert)

# 发送文本信息
bot_obj.send_text(msg='测试以下消息！', is_at_all=True)
# 发送图片信息
bot_obj.send_img(pic_url='https://picsum.photos/400/400')
# 发送锚点链接
bot_obj.send_link(title='Python自动化', text='学习测试...', message_url='https://www.baidu.com/', pic_url='https://picsum.photos/400/400')
# 发送markdown
bot_obj.send_md(title='Python自动化', text='### Welcome to you！\n'
                'My name is zhangsan！I live you compute！'
                '![Python](https://picsum.photos/400/400)')

# 发送卡片
card_list = [
    {'title': '黑山老妖', 'url': 'http://www.baidu.com/', 'pic_url': 'https://picsum.photos/400/400'},
    {'title': '深山老妖', 'url': 'http://www.baidu.com/', 'pic_url': 'https://picsum.photos/400/400'},
    {'title': '梁山好汉', 'url': 'http://www.baidu.com/', 'pic_url': 'https://picsum.photos/400/400'},
]
bot_obj.send_card(card_list=card_list)


# 发送多按钮卡片
btn = [
    {'title': '支持', 'url': 'https://www.baidu.com/'},
    {'title': '反对', 'url': 'https://www.baidu.com/'},
]
action = {
    'title': '首屏会话透出的展示内容',
    'text': '![选择](https://picsum.photos/400/400)\n这是一个风雨交加的晚上，我独自躺在街头上淋雨！！',
}
bot_obj.send_action_card(btn, action)


# 发送单按钮卡片
btn = {'title': '查看详情', 'url': 'https://www.baidu.com/'},
action = {
    'title': '首屏会话透出的展示内容',
    'text': '![选择](https://picsum.photos/400/400)\n这是一个风雨交加的晚上，我独自躺在街头上淋雨！！',
}
bot_obj.send_action_card(btn, action)
```

