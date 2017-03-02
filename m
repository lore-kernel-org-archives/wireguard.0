Return-Path: ehdot795@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d71526ae
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 13:35:16 +0000 (UTC)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
 [209.85.128.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ffa69b0
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 13:35:16 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id u108so52239326wrb.3
 for <wireguard@lists.zx2c4.com>; Thu, 02 Mar 2017 05:37:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <871sugpifa.fsf@alice.fifthhorseman.net>
References: <CACCLhZQtterheuB9NF4ppEAYbLKXtsPzCEnMGdtAS5KKVfPEjQ@mail.gmail.com>
 <871sugpifa.fsf@alice.fifthhorseman.net>
From: James Wilson <ehdot795@gmail.com>
Date: Thu, 2 Mar 2017 08:37:09 -0500
Message-ID: <CACCLhZTT78tEQzt5JK8nTs89bhV0ogJKo=k_7=vYhsfy8sgeGQ@mail.gmail.com>
Subject: Re: Encapsulation
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: multipart/alternative; boundary=001a1139b034a537ad0549bf8632
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1139b034a537ad0549bf8632
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks Daniel, that's what I was trying to figure out.

If what you're saying is true, if the encrypted blob contains an IP packet
it would mean that it would look like this

Ethernet
IP
UDP
Ethernet
IP
WG payload


James


On Wed, Mar 1, 2017 at 8:38 PM, Daniel Kahn Gillmor <dkg@fifthhorseman.net>
wrote:

> On Wed 2017-03-01 16:38:05 -0800, James Wilson wrote:
> > Hi,
> >
> > Just out of curiosity, how does a "wireguard packet' look like on the
> wire
> > ??
> >
> > I'm guessing:
> >
> >  Ethernet
> >  IP
> >  UDP
> > |------------------|
> > | IP               |
> > | WG payload       |
> > |------------------|
> >
> >
> > What's in the box is encrypted
> >
> > Is that right ?? If not, what does it look like?
>
> I believe the cleartext (after decryption) is an actual IP packet, so
> everything from layer3 up the stack.
>
>
> If anyone wants to document this sort of thing explicitly in a useful
> way, you might consider writing a wireshark dissector:
>
>   https://www.wireshark.org/docs/wsdg_html_chunked/ChDissectAdd.html
>
> and you can clone wireshark's source with:
>
>    git clone https://code.wireshark.org/review/wireshark
>
> The simplest thing would be to start with a dissector for the ciphertext
> itself, for the few pieces of metadata that are outside the encrypted
> packet (see e.g. =C2=A75.4.2 of
> https://www.wireguard.io/papers/wireguard.pdf)
>
> If you want to get more clever, you could add a mechanism to the
> wireguard module to extract session keys, and then make a decryptor
> plugin to wireshark. But start with just the ciphertext ;)
>
>       --dkg
>

--001a1139b034a537ad0549bf8632
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div>Thanks Daniel, tha=
t&#39;s what I was trying to figure out.<br><br></div>If what you&#39;re sa=
ying is true, if the encrypted blob contains an IP packet it would mean tha=
t it would look like this<br><br></div>Ethernet<br></div>IP<br></div>UDP<br=
></div>Ethernet<br></div>IP<br></div>WG payload<br><br><br></div>James<br><=
div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Wed, Mar 1, 2017 at 8:38 PM, Daniel Kahn Gillmor <span dir=3D"ltr">&l=
t;<a href=3D"mailto:dkg@fifthhorseman.net" target=3D"_blank">dkg@fifthhorse=
man.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Wed 2017-03-01 16:38:05 -0800, James Wilson wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Just out of curiosity, how does a &quot;wireguard packet&#39; look lik=
e on the wire<br>
&gt; ??<br>
&gt;<br>
&gt; I&#39;m guessing:<br>
&gt;<br>
&gt;=C2=A0 Ethernet<br>
&gt;=C2=A0 IP<br>
&gt;=C2=A0 UDP<br>
&gt; |------------------|<br>
&gt; | IP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt; | WG payload=C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt; |------------------|<br>
&gt;<br>
&gt;<br>
&gt; What&#39;s in the box is encrypted<br>
&gt;<br>
&gt; Is that right ?? If not, what does it look like?<br>
<br>
</span>I believe the cleartext (after decryption) is an actual IP packet, s=
o<br>
everything from layer3 up the stack.<br>
<br>
<br>
If anyone wants to document this sort of thing explicitly in a useful<br>
way, you might consider writing a wireshark dissector:<br>
<br>
=C2=A0 <a href=3D"https://www.wireshark.org/docs/wsdg_html_chunked/ChDissec=
tAdd.html" rel=3D"noreferrer" target=3D"_blank">https://www.wireshark.org/<=
wbr>docs/wsdg_html_chunked/<wbr>ChDissectAdd.html</a><br>
<br>
and you can clone wireshark&#39;s source with:<br>
<br>
=C2=A0 =C2=A0git clone <a href=3D"https://code.wireshark.org/review/wiresha=
rk" rel=3D"noreferrer" target=3D"_blank">https://code.wireshark.org/<wbr>re=
view/wireshark</a><br>
<br>
The simplest thing would be to start with a dissector for the ciphertext<br=
>
itself, for the few pieces of metadata that are outside the encrypted<br>
packet (see e.g. =C2=A75.4.2 of<br>
<a href=3D"https://www.wireguard.io/papers/wireguard.pdf" rel=3D"noreferrer=
" target=3D"_blank">https://www.wireguard.io/<wbr>papers/wireguard.pdf</a>)=
<br>
<br>
If you want to get more clever, you could add a mechanism to the<br>
wireguard module to extract session keys, and then make a decryptor<br>
plugin to wireshark. But start with just the ciphertext ;)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 --dkg<br>
</font></span></blockquote></div><br></div>

--001a1139b034a537ad0549bf8632--
