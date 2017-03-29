Return-Path: jftucker@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4501df8
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Mar 2017 05:44:36 +0000 (UTC)
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
 [209.85.128.178])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc36ec07
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Mar 2017 05:44:35 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id l43so3185449wre.1
 for <wireguard@lists.zx2c4.com>; Tue, 28 Mar 2017 22:49:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGhajTLcijc+gt7C=Bzx=SHF2MS_aQ_khYBxtULvzMWZUaCHPQ@mail.gmail.com>
References: <CAGhajTJG2gkyUjs8xmV=zYj_=tPjefHJ70mhnn9RALeC_bXY1w@mail.gmail.com>
 <CAHmME9qGc8+Qhch+ykUa5XN=dCOk55fFV8mNZ=GsjHPhznvmew@mail.gmail.com>
 <CAGhajTLcijc+gt7C=Bzx=SHF2MS_aQ_khYBxtULvzMWZUaCHPQ@mail.gmail.com>
From: James Tucker <jftucker@gmail.com>
Date: Tue, 28 Mar 2017 22:49:49 -0700
Message-ID: <CABGa_T9z8zwNbZQvWhi4f+VRi-c_7rFLVaKJ55_PDQae444aEg@mail.gmail.com>
Subject: Re: golang implemenation
To: Joe Blue <joeblew99@gmail.com>
Content-Type: multipart/alternative; boundary=f403045d55a6050914054bd82523
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045d55a6050914054bd82523
Content-Type: text/plain; charset=UTF-8

I have more in a local repo, but it's very disorganized as I'm taking a
more "port" approach with the internal structures right now. After some
discussions with Jason it seemed I wasn't keeping up enough with some of
the important internal behaviors. Once this port approach is a little
further along I'll be able to carve out meaningful individual pieces with
tests for submitting.

If you wanted something sooner, cobbling together the uapi code I have in
wireguard-go, with the implementation stuff in go-wireguard would probably
work relatively more quickly than I'll finish off, but the end goal I have
is a little cleaner than what that would be.

I don't suspect I have a ton of work to do, but mostly it's finding the
time to sit down and make decent chunks of progress, as my day to day is
quite full. If you or others are ready to lay down some time, I'd be more
than willing to push up pieces earlier and/or coordinate.

If I don't catch up with the ML soon enough, feel free to highlight me in
irc and/or reach out to me over other mediums. I don't keep up with this
email too well when I'm this busy.

On Fri, Mar 17, 2017 at 6:53 AM, Joe Blue <joeblew99@gmail.com> wrote:

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
>> Hello Joe,
>>
>> I defer to James Tucker, CCd, to describe the status of his
>> implementation.
>>
>> Regards,
>> Jason
>>
>

--f403045d55a6050914054bd82523
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have more in a local repo, but it&#39;s very disorganize=
d as I&#39;m taking a more &quot;port&quot; approach with the internal stru=
ctures right now. After some discussions with Jason it seemed I wasn&#39;t =
keeping up enough with some of the important internal behaviors. Once this =
port approach is a little further along I&#39;ll be able to carve out meani=
ngful individual pieces with tests for submitting.<div><br></div><div>If yo=
u wanted something sooner, cobbling together the uapi code I have in wiregu=
ard-go, with the implementation stuff in go-wireguard would probably work r=
elatively more quickly than I&#39;ll finish off, but the end goal I have is=
 a little cleaner than what that would be.</div><div><br></div><div>I don&#=
39;t suspect I have a ton of work to do, but mostly it&#39;s finding the ti=
me to sit down and make decent chunks of progress, as my day to day is quit=
e full. If you or others are ready to lay down some time, I&#39;d be more t=
han willing to push up pieces earlier and/or coordinate.</div><div><br></di=
v><div>If I don&#39;t catch up with the ML soon enough, feel free to highli=
ght me in irc and/or reach out to me over other mediums. I don&#39;t keep u=
p with this email too well when I&#39;m this busy.</div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Mar 17, 2017 at 6:53 A=
M, Joe Blue <span dir=3D"ltr">&lt;<a href=3D"mailto:joeblew99@gmail.com" ta=
rget=3D"_blank">joeblew99@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr">Thanks.<div><br></div><div>Seems this is =
the git endpojnt:=C2=A0<a href=3D"https://git.zx2c4.com/wireguard-go/about/=
" target=3D"_blank">https://git.zx2c4.<wbr>com/wireguard-go/about/</a></div=
><div><br></div><div>In the toDO there is a fair bit there. Is it ready for=
 me to be able to work on anything or still very bare bones ?</div><div><br=
></div><div><br><div><br></div><div><br></div></div></div><div class=3D"HOE=
nZb"><div class=3D"h5"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On F=
ri, Mar 17, 2017 at 1:34 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@=
zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Hello Joe,<br class=3D"m_8177536179291116185gmail_=
msg">
<br class=3D"m_8177536179291116185gmail_msg">
I defer to James Tucker, CCd, to describe the status of his implementation.=
<br class=3D"m_8177536179291116185gmail_msg">
<br class=3D"m_8177536179291116185gmail_msg">
Regards,<br class=3D"m_8177536179291116185gmail_msg">
Jason<br class=3D"m_8177536179291116185gmail_msg">
</blockquote></div>
</div></div></blockquote></div><br></div>

--f403045d55a6050914054bd82523--
