Return-Path: joeblew99@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5b69e33
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Mar 2017 07:08:31 +0000 (UTC)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
 [74.125.82.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2456448
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Mar 2017 07:08:31 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id a5so4589641oth.1
 for <wireguard@lists.zx2c4.com>; Wed, 29 Mar 2017 00:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAGhajTJG2gkyUjs8xmV=zYj_=tPjefHJ70mhnn9RALeC_bXY1w@mail.gmail.com>
 <CAHmME9qGc8+Qhch+ykUa5XN=dCOk55fFV8mNZ=GsjHPhznvmew@mail.gmail.com>
 <CAGhajTLcijc+gt7C=Bzx=SHF2MS_aQ_khYBxtULvzMWZUaCHPQ@mail.gmail.com>
 <CABGa_T9z8zwNbZQvWhi4f+VRi-c_7rFLVaKJ55_PDQae444aEg@mail.gmail.com>
In-Reply-To: <CABGa_T9z8zwNbZQvWhi4f+VRi-c_7rFLVaKJ55_PDQae444aEg@mail.gmail.com>
From: Joe Blue <joeblew99@gmail.com>
Date: Wed, 29 Mar 2017 07:13:36 +0000
Message-ID: <CAGhajTKpk8ge=ij_xAUy4pBfUQNhZoa1_SBOTCmnz8MxhXSSGw@mail.gmail.com>
Subject: Re: golang implemenation
To: James Tucker <jftucker@gmail.com>
Content-Type: multipart/alternative; boundary=001a113b0b6247247e054bd9516a
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113b0b6247247e054bd9516a
Content-Type: text/plain; charset=UTF-8

Ok, thanks for the update.

There is no rush from ym side. I was more interested in trying this out.
I am working in the Medical Industry where crypto is pretty important and
so am looking to run this between mobile devices and the servers.
I run golang on mobiles now.

Is there any impediment to running n Android and IOS ?

I can also try to help with the code. I worked in security but not really
crypto.

Regards

Joe (Berlin)

On Wed, Mar 29, 2017 at 7:49 AM James Tucker <jftucker@gmail.com> wrote:

> I have more in a local repo, but it's very disorganized as I'm taking a
> more "port" approach with the internal structures right now. After some
> discussions with Jason it seemed I wasn't keeping up enough with some of
> the important internal behaviors. Once this port approach is a little
> further along I'll be able to carve out meaningful individual pieces with
> tests for submitting.
>
> If you wanted something sooner, cobbling together the uapi code I have in
> wireguard-go, with the implementation stuff in go-wireguard would probably
> work relatively more quickly than I'll finish off, but the end goal I have
> is a little cleaner than what that would be.
>
> I don't suspect I have a ton of work to do, but mostly it's finding the
> time to sit down and make decent chunks of progress, as my day to day is
> quite full. If you or others are ready to lay down some time, I'd be more
> than willing to push up pieces earlier and/or coordinate.
>
> If I don't catch up with the ML soon enough, feel free to highlight me in
> irc and/or reach out to me over other mediums. I don't keep up with this
> email too well when I'm this busy.
>
> On Fri, Mar 17, 2017 at 6:53 AM, Joe Blue <joeblew99@gmail.com> wrote:
>
> Thanks.
>
> Seems this is the git endpojnt: https://git.zx2c4.com/wireguard-go/about/
>
> In the toDO there is a fair bit there. Is it ready for me to be able to
> work on anything or still very bare bones ?
>
>
>
>
>
> On Fri, Mar 17, 2017 at 1:34 PM Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
>
> Hello Joe,
>
> I defer to James Tucker, CCd, to describe the status of his implementation.
>
> Regards,
> Jason
>
>
>

--001a113b0b6247247e054bd9516a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, thanks for the update.=C2=A0<div><br></div><div>There =
is no rush from ym side. I was more interested in trying this out.=C2=A0</d=
iv><div>I am working in the Medical Industry where crypto is pretty importa=
nt and so am looking to run this between mobile devices and the servers.</d=
iv><div>I run golang on mobiles now.</div><div><br></div><div>Is there any =
impediment to running n Android and IOS ?</div><div><br></div><div>I can al=
so try to help with the code. I worked in security but not really crypto.</=
div><div><br></div><div>Regards</div><div><br></div><div>Joe (Berlin)</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Mar 29, 2017 =
at 7:49 AM James Tucker &lt;<a href=3D"mailto:jftucker@gmail.com">jftucker@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr" class=3D"gmail_msg">I have more in a local repo, but it&#39;s very=
 disorganized as I&#39;m taking a more &quot;port&quot; approach with the i=
nternal structures right now. After some discussions with Jason it seemed I=
 wasn&#39;t keeping up enough with some of the important internal behaviors=
. Once this port approach is a little further along I&#39;ll be able to car=
ve out meaningful individual pieces with tests for submitting.<div class=3D=
"gmail_msg"><br class=3D"gmail_msg"></div><div class=3D"gmail_msg">If you w=
anted something sooner, cobbling together the uapi code I have in wireguard=
-go, with the implementation stuff in go-wireguard would probably work rela=
tively more quickly than I&#39;ll finish off, but the end goal I have is a =
little cleaner than what that would be.</div><div class=3D"gmail_msg"><br c=
lass=3D"gmail_msg"></div><div class=3D"gmail_msg">I don&#39;t suspect I hav=
e a ton of work to do, but mostly it&#39;s finding the time to sit down and=
 make decent chunks of progress, as my day to day is quite full. If you or =
others are ready to lay down some time, I&#39;d be more than willing to pus=
h up pieces earlier and/or coordinate.</div><div class=3D"gmail_msg"><br cl=
ass=3D"gmail_msg"></div><div class=3D"gmail_msg">If I don&#39;t catch up wi=
th the ML soon enough, feel free to highlight me in irc and/or reach out to=
 me over other mediums. I don&#39;t keep up with this email too well when I=
&#39;m this busy.</div></div><div class=3D"gmail_extra gmail_msg"><br class=
=3D"gmail_msg"><div class=3D"gmail_quote gmail_msg">On Fri, Mar 17, 2017 at=
 6:53 AM, Joe Blue <span dir=3D"ltr" class=3D"gmail_msg">&lt;<a href=3D"mai=
lto:joeblew99@gmail.com" class=3D"gmail_msg" target=3D"_blank">joeblew99@gm=
ail.com</a>&gt;</span> wrote:<br class=3D"gmail_msg"><blockquote class=3D"g=
mail_quote gmail_msg" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr" class=3D"gmail_msg">Thanks.<div class=
=3D"gmail_msg"><br class=3D"gmail_msg"></div><div class=3D"gmail_msg">Seems=
 this is the git endpojnt:=C2=A0<a href=3D"https://git.zx2c4.com/wireguard-=
go/about/" class=3D"gmail_msg" target=3D"_blank">https://git.zx2c4.com/wire=
guard-go/about/</a></div><div class=3D"gmail_msg"><br class=3D"gmail_msg"><=
/div><div class=3D"gmail_msg">In the toDO there is a fair bit there. Is it =
ready for me to be able to work on anything or still very bare bones ?</div=
><div class=3D"gmail_msg"><br class=3D"gmail_msg"></div><div class=3D"gmail=
_msg"><br class=3D"gmail_msg"><div class=3D"gmail_msg"><br class=3D"gmail_m=
sg"></div><div class=3D"gmail_msg"><br class=3D"gmail_msg"></div></div></di=
v><div class=3D"m_3473197437565938273HOEnZb gmail_msg"><div class=3D"m_3473=
197437565938273h5 gmail_msg"><br class=3D"gmail_msg"><div class=3D"gmail_qu=
ote gmail_msg"><div dir=3D"ltr" class=3D"gmail_msg">On Fri, Mar 17, 2017 at=
 1:34 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" class=3D=
"gmail_msg" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br class=3D"gm=
ail_msg"></div><blockquote class=3D"gmail_quote gmail_msg" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Joe,<br class=
=3D"m_3473197437565938273m_8177536179291116185gmail_msg gmail_msg">
<br class=3D"m_3473197437565938273m_8177536179291116185gmail_msg gmail_msg"=
>
I defer to James Tucker, CCd, to describe the status of his implementation.=
<br class=3D"m_3473197437565938273m_8177536179291116185gmail_msg gmail_msg"=
>
<br class=3D"m_3473197437565938273m_8177536179291116185gmail_msg gmail_msg"=
>
Regards,<br class=3D"m_3473197437565938273m_8177536179291116185gmail_msg gm=
ail_msg">
Jason<br class=3D"m_3473197437565938273m_8177536179291116185gmail_msg gmail=
_msg">
</blockquote></div>
</div></div></blockquote></div><br class=3D"gmail_msg"></div>
</blockquote></div>

--001a113b0b6247247e054bd9516a--
