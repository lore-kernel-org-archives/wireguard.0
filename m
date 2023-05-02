Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5EFC77B7E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 May 2023 09:06:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3bc825c7;
	Tue, 2 May 2023 09:03:43 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [2607:f8b0:4864:20::131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 01f0a80b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2023 09:03:42 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-32f4e0f42a7so53085ab.1
 for <wireguard@lists.zx2c4.com>; Tue, 02 May 2023 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683018221; x=1685610221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NKVfIlBvsYHMWDxi0uBcvmDgbiWUYMz6a+J28iJYmJA=;
 b=2ad2cOPQIGv+I5wDpt6S7LzAQBXSlVZJ+z6YhICzmFlUutg4zMkL7TI279sxH540G8
 H+P7CZUZpNY1va1AxKMtQw6bX607072FfV/9Tx0qXqIiZKWOvuYFAgV53OPKsvvNOjSw
 sjB4CPq+byYze/jaktc2S/yGEZprfGz0ENy9in4n5OXSwYe01FnroZwhSHXilCTjBBZT
 nnCyYjkvLmrJfvnxmxtlDZmJAvXWoxrwT5vzAoqf5b6Rc1DkLGFMeMrmeO1I8cl9xlyH
 +zahBxiZp7+eCu1P3hgE4IO2jKqatDPLmAIL1S05RXMfmQ23FFFC/0stZWr4f+gdGk0l
 EXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683018221; x=1685610221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NKVfIlBvsYHMWDxi0uBcvmDgbiWUYMz6a+J28iJYmJA=;
 b=Tt5FSYHD/wCE9cc5sZEl+bwcyTuJtenjm5Mmm9HcIVJt+nJ2jAgqUzi/0HCajJtEK5
 b380YyqXFulIk6NYk0PxI4t8g9SurGUxmfyVERPaCSwv8EGGxni5SL+VqKAut7y4J0Zt
 6nZ1bo0GhPfhJWggXx7HWuRemJblm9CxQ62vAKtUlU1IAgqR50leaOssw7rYAk++fNyA
 bwZ8e8+OOqvKZOMzVYMg38CattUO3I3ZDrHCglmtQTTYFx6fTvZRvp09FOtAjoFbaIuR
 mxDZcUtmxge3Ksw6jvoiyST+sdo/P4hgaNnufQNgGxkCZxgUUhsv0k8v6tX3AuWXJa/F
 uONA==
X-Gm-Message-State: AC+VfDystoPc8js7R576ICmigWAevEY7RwQAi4vKp4887hISAWAoDSJ5
 H8pQZaH+ZteZmwWiHs2WlmjlCehyCObQsC3WF6Uphw==
X-Google-Smtp-Source: ACHHUZ747jLD/GDpZ0wLuJpv/ONcTgaCC5dR/I/K0IsHqe5jU64l+X+v7KsS7HlXQ828WToieUmI/aWMNaqocZ39qVc=
X-Received: by 2002:a05:6e02:1e06:b0:32b:7232:dac6 with SMTP id
 g6-20020a056e021e0600b0032b7232dac6mr231658ila.18.1683018220705; Tue, 02 May
 2023 02:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002e8a7c05fa9e1a7a@google.com>
 <bdb29f17-dac3-20a3-c726-963259b95208@gmail.com>
In-Reply-To: <bdb29f17-dac3-20a3-c726-963259b95208@gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 2 May 2023 11:03:29 +0200
Message-ID: <CANp29Y6UGNweLS7kDx+nji9z2hUi8wXVfioKwpYftQmE4ueJZQ@mail.gmail.com>
Subject: Re: [syzbot] Monthly wireguard report (Apr 2023)
To: "J.F. Samuels - K2CIB" <radiowhiz@gmail.com>
Cc: syzbot <syzbot+listded2f47f5f1d416c4059@syzkaller.appspotmail.com>, 
 Jason@zx2c4.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello John,

Do you mean only these monthly reports or all messages from the mailing lis=
ts?

You received this specific email because you're subscribed to one of
the following lists:

linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
wireguard@lists.zx2c4.com (the email was also sent to
syzkaller-bugs@googlegroups.com, but you're not a member of it -- I've
just checked).

You could determine the exact one by looking at the "Mailing-list"
header in the raw message.

--
Aleksandr

On Mon, May 1, 2023 at 5:56=E2=80=AFPM J.F. Samuels - K2CIB <radiowhiz@gmai=
l.com> wrote:
>
> I don't know how I subscribed to this - wish I knew enough to be of help!
>
> Please unsubscribe me from all related lists.
>
> Thanks,
>
> John
>
>
>
> On 5/1/2023 5:03 AM, syzbot wrote:
>
> Hello wireguard maintainers/developers,
>
> This is a 31-day syzbot report for the wireguard subsystem.
> All related reports/information can be found at:
> https://syzkaller.appspot.com/upstream/s/wireguard
>
> During the period, 1 new issues were detected and 0 were fixed.
> In total, 4 issues are still open and 13 have been fixed so far.
>
> Some of the still happening issues:
>
> Ref Crashes Repro Title
> <1> 620     No    KCSAN: data-race in wg_packet_send_staged_packets / wg_=
packet_send_staged_packets (3)
>                   https://syzkaller.appspot.com/bug?extid=3D6ba34f16b98fe=
40daef1
> <2> 440     No    KCSAN: data-race in wg_packet_decrypt_worker / wg_packe=
t_rx_poll (2)
>                   https://syzkaller.appspot.com/bug?extid=3Dd1de830e4ecda=
ac83d89
> <3> 6       No    KASAN: slab-use-after-free Write in enqueue_timer
>                   https://syzkaller.appspot.com/bug?extid=3Dc2775460db0e1=
c70018e
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> To disable reminders for individual bugs, reply with the following comman=
d:
> #syz set <Ref> no-reminders
>
> To change bug's subsystems, reply with:
> #syz set <Ref> subsystems: new-subsystem
>
> You may send multiple commands in a single email message.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/bdb29f17-dac3-20a3-c726-963259b95208%40gmail.com.
