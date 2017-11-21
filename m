Return-Path: kogeler@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c790f2be
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 16:34:22 +0000 (UTC)
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
 [209.85.223.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4596fc56
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 16:34:22 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id w127so20078174iow.11
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 08:39:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q6K_yBMMrrSMvMJmTxtn0miyugOrR1FuUwe22wnsjVXQ@mail.gmail.com>
References: <CALpTdxnL6akts71rb4yg+wisxqqs0U2wXPE5c12J9yMHVL6wGw@mail.gmail.com>
 <CAHmME9pokFyve7=UueDYYPvCU4LK-eQ4f0=GdZ7AocR6=BHGbQ@mail.gmail.com>
 <CAHmME9q6K_yBMMrrSMvMJmTxtn0miyugOrR1FuUwe22wnsjVXQ@mail.gmail.com>
From: =?UTF-8?B?0KDQvtC80LDQvSDQk9Cw0LLRgNC40LvQvtCy?= <kogeler@gmail.com>
Date: Tue, 21 Nov 2017 19:39:22 +0300
Message-ID: <CALpTdx=DQVHGQZf3phSTL=tbXNSpo+PvAQMsx1r3xDdCSj-txQ@mail.gmail.com>
Subject: Re: new bug on armhf
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="001a11426aee5d74ba055e80d8e5"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11426aee5d74ba055e80d8e5
Content-Type: text/plain; charset="UTF-8"

Hi!

Yes. The problem is solved. Thanks for the help.

2017-11-21 18:10 GMT+03:00 Jason A. Donenfeld <Jason@zx2c4.com>:

> Hi Roman,
>
> It took me all day to get a working configuration, due to a binutils
> bug, but I finally reproduced it, and then fixed the bug. Can you grab
> the latest git master `git fetch && git reset --hard origin/master`
> and let me know if it works for you?
>
> Thanks,
> Jason
>


-- 
Thanks,
Roman Gavrilov

--001a11426aee5d74ba055e80d8e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-result_box" class=3D"gmail-short_text" l=
ang=3D"en"><span>Hi!<br></span></span><div><div><span id=3D"gmail-result_bo=
x" class=3D"gmail-short_text" lang=3D"en"><span><br>Yes.</span> <span>The p=
roblem is solved.</span> <span class=3D"gmail-">Thanks for the help.</span>=
</span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">2017-11-21 18:10 GMT+03:00 Jason A. Donenfeld <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</sp=
an>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Roman,<br>
<br>
It took me all day to get a working configuration, due to a binutils<br>
bug, but I finally reproduced it, and then fixed the bug. Can you grab<br>
the latest git master `git fetch &amp;&amp; git reset --hard origin/master`=
<br>
and let me know if it works for you?<br>
<br>
Thanks,<br>
Jason<br>
</blockquote></div><br><br clear=3D"all"><span class=3D"gmail-HOEnZb gmail-=
adL"><font color=3D"#888888"><span class=3D"gmail-m_4475351729787776884gmai=
l-HOEnZb gmail-m_4475351729787776884gmail-adL"><font color=3D"#888888"><spa=
n class=3D"gmail-m_4475351729787776884gmail-m_6581058282960491625gmail-HOEn=
Zb gmail-m_4475351729787776884gmail-m_6581058282960491625gmail-adL"><font c=
olor=3D"#888888">-- <br><div class=3D"gmail-m_4475351729787776884gmail-m_65=
81058282960491625gmail-m_5673561690374840175gmail-m_4963248276163928978gmai=
l-m_-3577053390672033949gmail_signature"><div dir=3D"ltr">Thanks,</div><div=
>Roman Gavrilov</div></div></font></span></font></span></font></span><br></=
div></div>

--001a11426aee5d74ba055e80d8e5--
