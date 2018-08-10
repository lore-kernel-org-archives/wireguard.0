Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14d2e9a5
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 13:58:47 +0000 (UTC)
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1815af6a
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 13:58:46 +0000 (UTC)
Received: by mail-oi0-x229.google.com with SMTP id n21-v6so16021861oig.3
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 07:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
In-Reply-To: <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Fri, 10 Aug 2018 17:09:56 +0300
Message-ID: <CAKXLc7cEmbN6ZG4X88DNMf_CO-oy+tgrMskwExFnY=oCyWR6Yw@mail.gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
To: Brian Candler <b.candler@pobox.com>
Content-Type: multipart/alternative; boundary="0000000000001a15a50573154daf"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000001a15a50573154daf
Content-Type: text/plain; charset="UTF-8"

Please excuse my brevity, phone typing here...

On Fri, 10 Aug 2018, 16:36 Brian Candler, <b.candler@pobox.com> wrote:

> Thanks for explaining the project background, and your very sensible
> goals of simplicity and robustness.  And thanks for releasing this
> excellent piece of software.
>
>  From my point of view, the only thing which makes me uncomfortable
> about wireguard is the lack of any second authentication factor. Your
> private key is embedded in a plaintext file in your device (e.g.
> laptop), not even protected with a passphrase.

Not always. You can generate it on the fly (say 1st boot, no config file),
distribute it and be done. Or you can choose to protect it (e.g. pgp), may
be even store it in a HSM. Or throw it (keep in RAM) and regenerate, if
needed.

Anyone who gains access
> to that laptop is able to establish wireguard connections.
>
> Of course, it can be argued that the laptop holds other information
> which is more valuable that the wireguard key, therefore you should
> concentrate on properly securing the laptop itself (*). Furthermore, to
> be able to talk to the wireguard kernel module you're already root, and
> therefore have all sorts of malicious options available to you. etc etc
>
> But I'd feel a lot happier if a second level of authentication were
> required to establish a wireguard connection, if no packets had been
> flowing for more than a configurable amount of time - say, an hour. It
> would give some comfort around lost/stolen devices.
>
And what do we do (count or not) keepalive traffic?

Whilst I appreciate that wireguard is symmetrical, a common use case is
> to have remote "clients" with a central "office".  I'm thinking about a
> hook whereby the "office" side could request extra authentication when
> required - e.g. if it sees a connection from a wireguard public key
> which has been idle for more than a configurable amount of time, then it
> sends a challenge which requires (e.g.) a Yubikey to complete.  I
> appreciate that it's not going to be straightforward, requiring the
> kernel module to talk to userland components at both ends.
>
That is way overcomplicated...
And how did you solve your key distribution in such scenario BTW? (hint:
the functionality you request is part of key handling, i.e. NOT part of wg,
AFAIK). The office end can expire any user key and request sidechannel
(additional, 2FA or more) authentication via the established link. Who says
wg tunnel should be to the network core? Use a standard firewall, plug a
RADIUS even, or script your way on top of wg. Feel free to provide a clean
interface to wg and documentation and people who want that functionality
will use the code. Is there anything (e.g. design-level) that prevents
that? Or functionality that is lacking at the core?

>
> In the absence of that, it would be nice if the private key which is
> stored on the laptop were encrypted with a passphrase.  Simplest option
> may be to extend wg-quick so that the entire config file can be
> pgp-encrypted.
>

Now that also is not 2FA, and yes it should be a few lines of scripting.

Kalin.

--0000000000001a15a50573154daf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Please excuse my brevity, phone typing here...<br><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 10 Aug 2018, 16:36 Br=
ian Candler, &lt;<a href=3D"mailto:b.candler@pobox.com">b.candler@pobox.com=
</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks for explaining the project background, and your very sensible <br>
goals of simplicity and robustness.=C2=A0 And thanks for releasing this <br=
>
excellent piece of software.<br>
<br>
=C2=A0From my point of view, the only thing which makes me uncomfortable <b=
r>
about wireguard is the lack of any second authentication factor. Your <br>
private key is embedded in a plaintext file in your device (e.g. <br>
laptop), not even protected with a passphrase.=C2=A0</blockquote></div></di=
v><div dir=3D"auto">Not always. You can generate it on the fly (say 1st boo=
t, no config file), distribute it and be done. Or you can choose to protect=
 it (e.g. pgp), may be even store it in a HSM. Or throw it (keep in RAM) an=
d regenerate, if needed.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> Anyone who gain=
s access <br>
to that laptop is able to establish wireguard connections.<br>
<br>
Of course, it can be argued that the laptop holds other information <br>
which is more valuable that the wireguard key, therefore you should <br>
concentrate on properly securing the laptop itself (*). Furthermore, to <br=
>
be able to talk to the wireguard kernel module you&#39;re already root, and=
 <br>
therefore have all sorts of malicious options available to you. etc etc<br>
<br>
But I&#39;d feel a lot happier if a second level of authentication were <br=
>
required to establish a wireguard connection, if no packets had been <br>
flowing for more than a configurable amount of time - say, an hour. It <br>
would give some comfort around lost/stolen devices.<br></blockquote></div><=
/div><div dir=3D"auto">And what do we do (count or not) keepalive traffic?<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
Whilst I appreciate that wireguard is symmetrical, a common use case is <br=
>
to have remote &quot;clients&quot; with a central &quot;office&quot;.=C2=A0=
 I&#39;m thinking about a <br>
hook whereby the &quot;office&quot; side could request extra authentication=
 when <br>
required - e.g. if it sees a connection from a wireguard public key <br>
which has been idle for more than a configurable amount of time, then it <b=
r>
sends a challenge which requires (e.g.) a Yubikey to complete.=C2=A0 I <br>
appreciate that it&#39;s not going to be straightforward, requiring the <br=
>
kernel module to talk to userland components at both ends.<br></blockquote>=
</div></div><div dir=3D"auto">That is way overcomplicated...=C2=A0</div><di=
v dir=3D"auto">And how did you solve your key distribution in such scenario=
 BTW? (hint: the functionality you request is part of key handling, i.e. NO=
T part of wg, AFAIK). The office end can expire any user key and request si=
dechannel (additional, 2FA or more) authentication via the established link=
. Who says wg tunnel should be to the network core? Use a standard firewall=
, plug a RADIUS even, or script your way on top of wg. Feel free to provide=
 a clean interface to wg and documentation and people who want that functio=
nality will use the code. Is there anything (e.g. design-level) that preven=
ts that? Or functionality that is lacking at the core?</div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
In the absence of that, it would be nice if the private key which is <br>
stored on the laptop were encrypted with a passphrase.=C2=A0 Simplest optio=
n <br>
may be to extend wg-quick so that the entire config file can be <br>
pgp-encrypted.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></b=
lockquote></div></div><div dir=3D"auto">Now that also is not 2FA, and yes i=
t should be a few lines of scripting.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Kalin.</div></div>

--0000000000001a15a50573154daf--
