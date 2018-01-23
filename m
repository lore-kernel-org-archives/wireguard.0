Return-Path: aurelien.chabot@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43e6f722
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Jan 2018 01:48:39 +0000 (UTC)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
 [209.85.128.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e1f0ce1
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Jan 2018 01:48:39 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id 100so10755183wrb.7
 for <wireguard@lists.zx2c4.com>; Mon, 22 Jan 2018 17:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20171107043817.9050-1-aurelien@chabot.fr>
 <68455df5-a429-09aa-308d-fc3615557530@hall-andersen.dk>
 <CAJup9ciQfnxJ8joN3bHT2Aqw3shV_=P-tQ6v-gw3RSM1R1VdPg@mail.gmail.com>
In-Reply-To: <CAJup9ciQfnxJ8joN3bHT2Aqw3shV_=P-tQ6v-gw3RSM1R1VdPg@mail.gmail.com>
From: =?UTF-8?Q?Aur=C3=A9lien_Chabot?= <aurelien@chabot.fr>
Date: Tue, 23 Jan 2018 01:52:30 +0000
Message-ID: <CAJup9cgEfM4WVH=7Zv7=tr9kF2fN6u2_eiwPF4QfT+KmWSPgPA@mail.gmail.com>
Subject: Re: WireGuard root-less support for android
To: Mathias Hall-Andersen <mathias@hall-andersen.dk>
Content-Type: multipart/alternative; boundary="089e082fa35c4b6493056367cdf8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--089e082fa35c4b6493056367cdf8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathias,

Did you had thought about the support of wireguard-go for android?
I'll be happy to rebase the work I did before on wireguard-go to get that a
new go.

Aur=C3=A9lien

On Thu, Nov 9, 2017 at 8:50 AM Aur=C3=A9lien Chabot <aurelien@chabot.fr> wr=
ote:

> The GetUDPConn is used to forward the socket id to the Java layer. The
> android API allow to protect the socket from being route to the VPN, maki=
ng
> the job of using the VPN as default route easy.
>
> About the close, good to know I am not missing something. I might spit th=
e
> patch then, so the bug fix doesn't get stuck with the rest.
>
> Aur=C3=A9lien
>
> On Thu, Nov 9, 2017, 04:48 Mathias Hall-Andersen <mathias@hall-andersen.d=
k>
> wrote:
>
>> Hi Aur=C3=A9lien
>>
>> Thanks for contributing to the wireguard-go project.
>>
>> I never anticipated for the implementation to be used as a library.
>> This means that I either have to:
>>
>> 1. Settle for an API and reconsider what is exported and not.
>> 2. Give no guarantees about API stability
>>
>> Providing the functionality as a library might be the cleanest solution
>> in this case.
>> One option is to have an internal package and a small exported API.
>>
>> Is the GetUDPConn only used to wait for the device to bind?
>>
>> The missing device.tun.device.Close() is indeed a bug.
>>
>> I will look more at your patches during the weekend,
>> Thanks once again.
>>
>> Mathias
>>
>

--089e082fa35c4b6493056367cdf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mathias,<div><br></div><div>Did you had thought about t=
he support of wireguard-go for android?</div><div>I&#39;ll be happy to reba=
se the work I did before on wireguard-go to get that a new go.</div><div di=
r=3D"ltr"><div><br></div><div>Aur=C3=A9lien</div><div><br></div></div><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Nov 9, 2017 at 8:50 AM Aur=
=C3=A9lien Chabot &lt;<a href=3D"mailto:aurelien@chabot.fr" target=3D"_blan=
k">aurelien@chabot.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><p dir=3D"ltr">The GetUDPConn is used to forward the socket id to the Jav=
a layer. The android API allow to protect the socket from being route to th=
e VPN, making the job of using the VPN as default route easy.</p>
<p dir=3D"ltr">About the close, good to know I am not missing something. I =
might spit the patch then, so the bug fix doesn&#39;t get stuck with the re=
st.</p>
<p dir=3D"ltr">Aur=C3=A9lien</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Nov 9, 2017, 04:48 =
Mathias Hall-Andersen &lt;<a href=3D"mailto:mathias@hall-andersen.dk" targe=
t=3D"_blank">mathias@hall-andersen.dk</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Hi Aur=C3=A9lien<br>
<br>
Thanks for contributing to the wireguard-go project.<br>
<br>
I never anticipated for the implementation to be used as a library.<br>
This means that I either have to:<br>
<br>
1. Settle for an API and reconsider what is exported and not.<br>
2. Give no guarantees about API stability<br>
<br>
Providing the functionality as a library might be the cleanest solution<br>
in this case.<br>
One option is to have an internal package and a small exported API.<br>
<br>
Is the GetUDPConn only used to wait for the device to bind?<br>
<br>
The missing device.tun.device.Close() is indeed a bug.<br>
<br>
I will look more at your patches during the weekend,<br>
Thanks once again.<br>
<br>
Mathias<br>
</blockquote></div></blockquote></div></div>

--089e082fa35c4b6493056367cdf8--
