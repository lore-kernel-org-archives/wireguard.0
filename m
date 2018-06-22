Return-Path: baines.jacob@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c456eda9
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 13:03:17 +0000 (UTC)
Received: from mail-ot0-x230.google.com (mail-ot0-x230.google.com
 [IPv6:2607:f8b0:4003:c0f::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66fd4bc1
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 13:03:16 +0000 (UTC)
Received: by mail-ot0-x230.google.com with SMTP id d19-v6so7412553oti.8
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jun 2018 06:08:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6645df4c-3f98-6df9-fc48-6748ad4d6c00@unstable.cc>
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <a7989c95-0047-dfe9-e870-59db44fbb463@unstable.cc>
 <CgE9_flxwDk6vYs9xSAoTvLJp5qHdNF20xieK4syAMzldOBqEq5lZ3gZN77A7ambiqtFeuBfm-jXarYLMvcY4LAn1aC9ub1su871JPhDpUo=@protonmail.ch>
 <6645df4c-3f98-6df9-fc48-6748ad4d6c00@unstable.cc>
From: Jacob Baines <baines.jacob@gmail.com>
Date: Fri, 22 Jun 2018 09:08:17 -0400
Message-ID: <CAEypN9LgpCN_3Zt3H4YgUEtiJWFF7d-=H=jQoTH9DNUN3DX42w@mail.gmail.com>
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
To: Antonio Quartulli <a@unstable.cc>
Content-Type: multipart/alternative; boundary="000000000000adff3c056f3ab93f"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: baines.jacob@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000adff3c056f3ab93f
Content-Type: text/plain; charset="UTF-8"

Hey all,

  I'm not familiar with WireGuard so I can only speak in an OpenVPN
context. If the following doesn't apply to WireGuard at all than feel free
to ignore me.

  My main problem with "--script-security" is that its useless. It just
causes OpenVPN to spit a line into a log file (and by that time its too
late anyways). That isn't a security mechanism.

  There also seems to be an expectation that users should understand these
config files. I'm not sure why that is. Excuse my speaking in generalities
but a majority of users aren't going to understand how OpenVPN works, let
alone how the configuration file affects the program. Many users (myself
included) simply receive config files from our bosses or our IT guy and
trust that they aren't malicious. Call me naive or foolish but I don't
review every single file passed my way for malicious content.

   Furthermore, I've heard a few times now "config files exec things". Off
the top of my head, I can't think of any other applications that execute
shell commands listed in their configuration file. I have no idea where
that is coming from. Its not a smart practice from a security point of view.

   I'm not an OpenVPN expert. I'm just some guy that spent a little time
reviewing the source. So I accept that my opinions might be bad. But if I
was I dev I'd deprecate the entire system of executing programs listed in
the configuration file. I'd try to migrate code into OpenVPN itself or the
plugin system. At the very least, prompting the user and asking them for
permission to execute whatever command seems like an improvement to me.

-Jake



On Fri, Jun 22, 2018 at 6:53 AM, Antonio Quartulli <a@unstable.cc> wrote:

>
>
> On 22/06/18 18:46, Jordan Glover wrote:
> > On June 22, 2018 3:56 AM, Antonio Quartulli <a@unstable.cc> wrote:
> >>
> >> In case this might be useful: in OpenVPN there is an additional
> >>
> >> parameter called "--script-security" that requires to be set to a
> >>
> >> certain level before allowing configured scripts to be executed.
> >>
> >> Unfortunately there is no real protection against the clueless user, who
> >>
> >> can and will blindly enable that setting if asked by a $random VPN
> provider.
> >>
> >> However, I still believe (and hope) that forcing the user to enable a
> >>
> >> specific knob may raise the level of attention.
> >>
> >> Maybe something similar could be added as a command line parameter to
> >>
> >> wg/wg-quick so that it will execute the various
> >>
> >> PostUp/PreUp/PostDown/PreDown only if allowed to?
> >>
> >> Just as a side note: this is not a VPN specific problem, this is
> >>
> >> something users can end up with everytime they execute some binary with
> >>
> >> a configuration they have not inspected. So, be careful out there ;-)
> >>
> >> Cheers,
> >>
> >
> > Attacker can pass appropriate "--script-security" level with the very
> same config
> > containing malicious commands so this isn't solving problem of not
> looking at
> > the content of config files.
>
> that's why I suggested to implement it as a command line knob for
> wg/wg-quick.
>
> But I totally agree with you that against this kind of issues there is
> not really a lot the developer can do - each of us is free to shoot
> himself in the foot.
>
> Regards,
>
> --
> Antonio Quartulli
>
>

--000000000000adff3c056f3ab93f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey all,<div><br></div><div>=C2=A0 I&#39;m not familiar wi=
th WireGuard so I can only speak in an OpenVPN context. If the following do=
esn&#39;t apply to WireGuard at all than feel free to ignore me.</div><div>=
<br></div><div>=C2=A0 My main problem with &quot;--script-security&quot; is=
 that its useless. It just causes OpenVPN to spit a line into a log file (a=
nd by that time its too late anyways). That isn&#39;t a security mechanism.=
</div><div><br></div><div>=C2=A0 There also seems to be an expectation that=
 users should understand these config files. I&#39;m not sure why that is. =
Excuse my speaking in generalities but a majority of users aren&#39;t going=
 to understand how OpenVPN works, let alone how the configuration file affe=
cts the program. Many users (myself included) simply receive config files f=
rom our bosses or our IT guy and trust that they aren&#39;t malicious. Call=
 me naive or foolish but I don&#39;t review every single file passed my way=
 for malicious content.</div><div><br></div><div>=C2=A0 =C2=A0Furthermore, =
I&#39;ve heard a few times now &quot;config files exec things&quot;. Off th=
e top of my head, I can&#39;t think of any other applications that execute =
shell commands listed in their configuration file. I have no idea where tha=
t is coming from. Its not a smart practice from a security point of view.</=
div><div><br></div><div>=C2=A0 =C2=A0I&#39;m not an OpenVPN expert. I&#39;m=
 just some guy that spent a little time reviewing the source. So I accept t=
hat my opinions might be bad. But if I was I dev I&#39;d deprecate the enti=
re system of executing programs listed in the configuration file. I&#39;d t=
ry to migrate code into OpenVPN itself or the plugin system. At the very le=
ast, prompting the user and asking them for permission to execute whatever =
command seems like an improvement to me.</div><div><br></div><div>-Jake</di=
v><div><br></div><div>=C2=A0=C2=A0</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Fri, Jun 22, 2018 at 6:53 AM, Antonio Quart=
ulli <span dir=3D"ltr">&lt;<a href=3D"mailto:a@unstable.cc" target=3D"_blan=
k">a@unstable.cc</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D""><br>
<br>
On 22/06/18 18:46, Jordan Glover wrote:<br>
&gt; On June 22, 2018 3:56 AM, Antonio Quartulli &lt;a@unstable.cc&gt; wrot=
e:<br>
&gt;&gt;<br>
&gt;&gt; In case this might be useful: in OpenVPN there is an additional<br=
>
&gt;&gt;<br>
&gt;&gt; parameter called &quot;--script-security&quot; that requires to be=
 set to a<br>
&gt;&gt;<br>
&gt;&gt; certain level before allowing configured scripts to be executed.<b=
r>
&gt;&gt;<br>
&gt;&gt; Unfortunately there is no real protection against the clueless use=
r, who<br>
&gt;&gt;<br>
&gt;&gt; can and will blindly enable that setting if asked by a $random VPN=
 provider.<br>
&gt;&gt;<br>
&gt;&gt; However, I still believe (and hope) that forcing the user to enabl=
e a<br>
&gt;&gt;<br>
&gt;&gt; specific knob may raise the level of attention.<br>
&gt;&gt;<br>
&gt;&gt; Maybe something similar could be added as a command line parameter=
 to<br>
&gt;&gt;<br>
&gt;&gt; wg/wg-quick so that it will execute the various<br>
&gt;&gt;<br>
&gt;&gt; PostUp/PreUp/PostDown/PreDown only if allowed to?<br>
&gt;&gt;<br>
&gt;&gt; Just as a side note: this is not a VPN specific problem, this is<b=
r>
&gt;&gt;<br>
&gt;&gt; something users can end up with everytime they execute some binary=
 with<br>
&gt;&gt;<br>
&gt;&gt; a configuration they have not inspected. So, be careful out there =
;-)<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt; <br>
&gt; Attacker can pass appropriate &quot;--script-security&quot; level with=
 the very same config<br>
&gt; containing malicious commands so this isn&#39;t solving problem of not=
 looking at<br>
&gt; the content of config files. <br>
<br>
</span>that&#39;s why I suggested to implement it as a command line knob fo=
r<br>
wg/wg-quick.<br>
<br>
But I totally agree with you that against this kind of issues there is<br>
not really a lot the developer can do - each of us is free to shoot<br>
himself in the foot.<br>
<br>
Regards,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
Antonio Quartulli<br>
<br>
</font></span></blockquote></div><br></div>

--000000000000adff3c056f3ab93f--
