Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f14a3d5a
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:44:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21202fe7
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:44:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef62bfb0
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:44:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3214df9a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:44:20 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id x188so3763393itb.0
 for <wireguard@lists.zx2c4.com>; Thu, 04 May 2017 11:54:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9r=jk7dgL5nn3HZ2bFFQe-3weLcExy8V_Bor70svSZsYA@mail.gmail.com>
References: <CAM3m09RKuXF=HkvGFpH3=VxW2PvqDx2BpB3yfLkMcZgLhm_X9w@mail.gmail.com>
 <CAHmME9p0L8WjCvcrtk+8AeOxmnExSK5YhnCcNbYmxmp_Yc_ejg@mail.gmail.com>
 <CAHmME9oeaMNrbN1Eek=0p7xR54oCZgBRVjnR-UgcQAoPaJczGQ@mail.gmail.com>
 <CAM3m09QjwL9cyU66VXA0B8o88BcMiqTXm5Qhp-DKkaYu_A8PfA@mail.gmail.com>
 <CAHmME9qkJp0Xba2QhQKDd2DpMRHRkXhR=0MqXcJR8zEeRAXCaA@mail.gmail.com>
 <CAM3m09QO9Zkmvwr47NK5gxX8ongDjWKu7z1Y+pimLoG=XzgpVg@mail.gmail.com>
 <CAHmME9rSXyOPCO1GLhWKuXTZk+b8swNmEoHeYPosWJ5vt83pmg@mail.gmail.com>
 <CAHmME9oECt9DR9knvxnTynYwvRtEXvBv+U+WHjVPWWM1yGCWSQ@mail.gmail.com>
 <CAHmME9r=jk7dgL5nn3HZ2bFFQe-3weLcExy8V_Bor70svSZsYA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 May 2017 20:54:07 +0200
Message-ID: <CAHmME9orHUhg0oLgbRZMV2Gq49Kv=VCQxR-6Fovp7xXiH_Va8Q@mail.gmail.com>
Subject: Re: Specifying the source port
To: Ryan Whelan <rcwhelan@gmail.com>
Content-Type: multipart/alternative; boundary=001a1140f76c3ad850054eb74c4b
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1140f76c3ad850054eb74c4b
Content-Type: text/plain; charset=UTF-8

UDP is a bit strange like that. Everything implicitly must "listen" when
using UDP, even when the source port is ephemeral. So the listening port
and the source port concepts get smushed into one thing.

On May 4, 2017 20:47, "Ryan Whelan" <rcwhelan@gmail.com> wrote:

I believe you- I didn't understand that it used the same port number for
both ingress and egress traffic.  I managed to miss that.

thank you much!

ryan

On Thu, May 4, 2017 at 2:43 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> My answer remains correct. Use the listen port to control the source port.
> If you don't believe me, try running tcpdump and you'll see.
>
> On May 4, 2017 20:41, "Ryan Whelan" <rcwhelan@gmail.com> wrote:
>
>> If i'm not mistaken that sets the listing port on one end (Peer 'A') of
>> the connection.  Peer 'B' needs to know what the listening port is set to,
>> to be able to setup the handshake.  So from peer 'B's perspective, the dst
>> port is the "listen-port' on Peer 'A'.... How do I set the src port for
>> peer 'B' so all traffic from B will come from a predicable source port?
>>
>> I'm sorry if i'm not being clear- I very well might not be using the
>> right terminology
>>
>> ryan
>>
>> On Thu, May 4, 2017 at 2:35 PM, Jason A. Donenfeld <Jason@zx2c4.com>
>> wrote:
>>
>>> "ListenPort", " listen-port"
>>>
>>> On May 4, 2017 20:21, "Ryan Whelan" <rcwhelan@gmail.com> wrote:
>>>
>>> Hello!
>>>
>>> When specifying an endpoint, you have to tell wg which dst port the peer
>>> is listening on- is it possible to tell wg which source port to send
>>> traffic from?  I've looked over the documentation and if its in there, I
>>> managed to miss it.
>>>
>>> Thanks!
>>>
>>> ryan
>>>
>>> _______________________________________________
>>> WireGuard mailing list
>>> WireGuard@lists.zx2c4.com
>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>>
>>>
>>>
>>

--001a1140f76c3ad850054eb74c4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">UDP is a bit strange like that. Everything implicitly mus=
t &quot;listen&quot; when using UDP, even when the source port is ephemeral=
. So the listening port and the source port concepts get smushed into one t=
hing.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On May=
 4, 2017 20:47, &quot;Ryan Whelan&quot; &lt;<a href=3D"mailto:rcwhelan@gmai=
l.com">rcwhelan@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquot=
e class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr">I believe you- I didn&#39;t understand that=
 it used the same port number for both ingress and egress traffic.=C2=A0 I =
managed to miss that.<div><br></div><div>thank you much!</div><font color=
=3D"#888888"><div><br></div><div>ryan</div></font></div><div class=3D"elide=
d-text"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, M=
ay 4, 2017 at 2:43 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">My answer remains =
correct. Use the listen port to control the source port. If you don&#39;t b=
elieve me, try running tcpdump and you&#39;ll see.</div><div class=3D"m_601=
787192263130671HOEnZb"><div class=3D"m_601787192263130671h5"><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On May 4, 2017 20:41, &quot;Rya=
n Whelan&quot; &lt;<a href=3D"mailto:rcwhelan@gmail.com" target=3D"_blank">=
rcwhelan@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">If i&#39;m not mistaken that sets the listin=
g port on one end (Peer &#39;A&#39;) of the connection.=C2=A0 Peer &#39;B&#=
39; needs to know what the listening port is set to, to be able to setup th=
e handshake.=C2=A0 So from peer &#39;B&#39;s perspective, the dst port is t=
he &quot;listen-port&#39; on Peer &#39;A&#39;.... How do I set the src port=
 for peer &#39;B&#39; so all traffic from B will come from a predicable sou=
rce port?<div><br></div><div>I&#39;m sorry if i&#39;m not being clear- I ve=
ry well might not be using the right terminology</div><div><br></div><div>r=
yan =C2=A0</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Thu, May 4, 2017 at 2:35 PM, Jason A. Donenfeld <span dir=3D"ltr">&=
lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div=
>&quot;ListenPort&quot;, &quot; listen-port&quot;<br><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote"><div><div class=3D"m_601787192263130671=
m_7922488072485641131m_5377503442994895593h5">On May 4, 2017 20:21, &quot;R=
yan Whelan&quot; &lt;<a href=3D"mailto:rcwhelan@gmail.com" target=3D"_blank=
">rcwhelan@gmail.com</a>&gt; wrote:<br type=3D"attribution"></div></div><bl=
ockquote class=3D"m_601787192263130671m_7922488072485641131m_53775034429948=
95593m_-5814849043790190054quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div class=3D"m_601787192263130671m_792=
2488072485641131m_5377503442994895593h5"><div dir=3D"ltr">Hello!<div><br></=
div><div>When specifying an endpoint, you have to tell wg which dst port th=
e peer is listening on- is it possible to tell wg which source port to send=
 traffic from?=C2=A0 I&#39;ve looked over the documentation and if its in t=
here, I managed to miss it.</div><div><br></div><div>Thanks!</div><font col=
or=3D"#888888"><div><br></div><div>ryan</div></font></div>
<br></div></div>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div></div></div>
</blockquote></div><br></div>
</blockquote></div></div>
</div></div></blockquote></div><br></div>
</div></blockquote></div><br></div>

--001a1140f76c3ad850054eb74c4b--
