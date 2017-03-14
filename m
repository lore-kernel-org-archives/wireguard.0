Return-Path: saschagrunert@icloud.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be6ca809
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Mar 2017 18:46:33 +0000 (UTC)
Received: from st11p00im-asmtp004.me.com (st11p00im-asmtp004.me.com
 [17.172.80.98])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acec09e7
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Mar 2017 18:46:32 +0000 (UTC)
Received: from process-dkim-sign-daemon.st11p00im-asmtp004.me.com by
 st11p00im-asmtp004.me.com
 (Oracle Communications Messaging Server 7.0.5.38.0 64bit (built Feb 26 2016))
 id <0OMT00M00GPWXX00@st11p00im-asmtp004.me.com> for wireguard@lists.zx2c4.com;
 Tue, 14 Mar 2017 18:50:00 +0000 (GMT)
Date: Tue, 14 Mar 2017 19:49:28 +0100
From: Sascha Grunert <saschagrunert@icloud.com>
To: sopium <sopium@mysterious.site>
Message-id: <8726b4ef-f654-4be5-8025-865a55187c77@Spark>
In-reply-to: <15acda6e9bc.b852f6478142.4195445703657110954@mysterious.site>
References: <E63B612D-BFAA-48FE-A352-25B4C11B8E05@icloud.com>
 <15acda6e9bc.b852f6478142.4195445703657110954@mysterious.site>
Subject: Re: Rust implementation status
MIME-version: 1.0
Content-type: multipart/alternative; boundary=58c83b4e_6b8b4567_103
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--58c83b4e_6b8b4567_103
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hey guys,

I would really like to do that. =46or the main development I would throw =
this into discussion: https://github.com/WireGuard/wireguard-rs/issues/1=23=
issuecomment-286521908

I guess it would be more visible to the Rust community if we allow mainta=
ining it via the GitHub repository.

=40Jason, what do you think=3F

Best regards,
Sascha

Am 14. M=C3=A4rz 2017, 17:29 +0100 schrieb sopium <sopium=40mysterious.si=
te>:
> Hi Sascha and folks,
>
> ---- On Sun, 05 Mar 2017 20:42:00 +0900 Sascha Grunert <saschagrunert=40=
icloud.com> wrote ----
> > Hey folks,
> >
> > I want to call for participation of the Rust userspace implementation=
 of WireGuard. The template for the initial implementation was this: http=
s://www.wireguard.io/xplatform/ and can be found here: https://git.zx2c4.=
com/wireguard-rs/.
> >
> > What works for now:
> >
> > - A main working executable (=60cargo run -- -h=60) which parses the =
command line parameters via the =60clap=60 crate
> > - General debug and tracing support via the =60log=60 crate
> > - Daemonizing support
> > - The wireguard library which creates a local socket and waits for in=
coming connections (reference implementation)
> >
> > =5B...=5D
>
> I have kept an eye on this. It seems that you were mostly working
> on the =60xplatform=60 stuff, and haven't started on the actual
> implementation of the protocol yet. My code has (partly)
> implemented the protocol, but lacks the =60xplatform=60 ui. So it
> seems like a perfect time to merge efforts. What do you think=3F
>
> And to all who are interested in userspace WG impls, in
> particular Rust impls, I have adjusted the goal of my project to
> =E2=80=9Cto write a secure, compatible, cross-platform and reasonably
> fast user-space implementation of WireGuard in Rust=E2=80=9D. I am also=

> committed to finishing and maintaining it. There is a big TODO
> list, and contribution is welcome=21
>
> =46or those not closely following this thread, the project is at:
>
> https://github.com/sopium/titun/tree/wg
>
> Regards,
> Sopium
>
>

--58c83b4e_6b8b4567_103
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>Hey guys,<br />
<br />
I would really like to do that. =46or the main development I would throw =
this into discussion: https://github.com/WireGuard/wireguard-rs/issues/1=23=
issuecomment-286521908<br />
<br />
I guess it would be more visible to the Rust community if we allow mainta=
ining it via the GitHub repository.<br />
<br />
=40Jason, what do you think=3F</div>
<div name=3D=22messageSignatureSection=22><br />
Best regards,<br />
Sascha</div>
<div name=3D=22messageReplySection=22><br />
Am 14. M=C3=A4rz 2017, 17:29 +0100 schrieb sopium &lt;sopium=40mysterious=
.site&gt;:<br />
<blockquote type=3D=22cite=22>Hi Sascha and folks,<br />
<br />
---- On Sun, 05 Mar 2017 20:42:00 +0900 Sascha Grunert &lt;saschagrunert=40=
icloud.com&gt; wrote ----<br />
<blockquote type=3D=22cite=22>Hey folks,<br />
<br />
I want to call for participation of the Rust userspace implementation of =
WireGuard. The template for the initial implementation was this: https://=
www.wireguard.io/xplatform/ and can be found here: https://git.zx2c4.com/=
wireguard-rs/.<br />
<br />
What works for now:<br />
<br />
- A main working executable (=60cargo run -- -h=60) which parses the comm=
and line parameters via the =60clap=60 crate<br />
- General debug and tracing support via the =60log=60 crate<br />
- Daemonizing support<br />
- The wireguard library which creates a local socket and waits for incomi=
ng connections (reference implementation)<br />
<br />
=5B...=5D<br /></blockquote>
<br />
I have kept an eye on this. It seems that you were mostly working<br />
on the =60xplatform=60 stuff, and haven't started on the actual<br />
implementation of the protocol yet. My code has (partly)<br />
implemented the protocol, but lacks the =60xplatform=60 ui. So it<br />
seems like a perfect time to merge efforts. What do you think=3F<br />
<br />
And to all who are interested in userspace WG impls, in<br />
particular Rust impls, I have adjusted the goal of my project to<br />
=E2=80=9Cto write a secure, compatible, cross-platform and reasonably<br =
/>
fast user-space implementation of WireGuard in Rust=E2=80=9D. I am also<b=
r />
committed to finishing and maintaining it. There is a big TODO<br />
list, and contribution is welcome=21<br />
<br />
=46or those not closely following this thread, the project is at:<br />
<br />
https://github.com/sopium/titun/tree/wg<br />
<br />
Regards,<br />
Sopium<br />
<br />
<br /></blockquote>
</div>
</body>
</html>

--58c83b4e_6b8b4567_103--
