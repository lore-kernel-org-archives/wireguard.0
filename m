Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0a339e3
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 15:56:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7379a663
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 15:56:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92b31a9c
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 15:33:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba9cec09
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 15:33:07 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id h11-v6so8470354oic.3
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 08:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <86d4ddc168ce2c5ac69bede349a44b50d68d6555.camel@e-queo.com>
 <c2634cf8-28bf-816f-fe91-6e988cc6bbdc@gmail.com>
In-Reply-To: <c2634cf8-28bf-816f-fe91-6e988cc6bbdc@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Apr 2018 15:56:49 +0000
Message-ID: <CAHmME9pZtn8i5dFC1xPNj-9x3yE+zKy86JWDtVB_mgJxNo=cpw@mail.gmail.com>
Subject: Re: Problems with IP
To: joe@solidadmin.com
Content-Type: multipart/alternative; boundary="0000000000001ab8b7056a49bd9f"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000001ab8b7056a49bd9f
Content-Type: text/plain; charset="UTF-8"

Hey Joe,

Maybe we should patch the rpm for RHEL in some way? I can probably work
around the old iproute2 by doing a different ip-rule(8) trick, if you'd be
up for shipping that.

Jason

--
Sent from my telephone.

On Fri, Apr 20, 2018, 16:48 Aaron Jones <aaronmdjones@gmail.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> On 20/04/18 14:32, bessonov.victor@e-queo.com wrote:
> > I've tried to run this instruction manually, result is still the
> > same. The system runs CentOS 7 and properly updated.
>
> Updated, yes; but not up to date. The version of iproute2 is too old.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
> Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/
>
> iQIcBAEBCAAGBQJa2f2dAAoJEIrwc3SIqzASCVMP/A9tBO8Sbl1z9rGK0q9vjdyK
> kMeFxKGVWqR4Xz8Sy9wfS+iKeXlBQxKukaZCTuSDr9WzsbpzvohYcE0FvGuDPZgf
> G9TgrGK9NAPow6pIdCfgeIIUnBQQ5geLtnxXKdrr7yaXn2rB8KWi1nwM+NbenNnC
> iJcPe7U9I+RzlDwESTHJMJJGR4hI8zbRSU4H3Nb2PEoYpizHUQuG56RGmOSDO08a
> 1+uol4iBsR0EEBqyt3PUDjuSTjXSAm6G328pErC+aU6I9wP+FHsFUvfMnVd7GDG1
> mJfVx2R8mLInlWX0gpL9YgelOC+/jIRDOeNKvdQAoqF3+7Tz+mT7J++/FLdQa3Sq
> mgHaX+Tvjw6Rnl9KEYC9DqclmHuaoeAHtp7FGnxOXrSOE6fwVh/4BsfKKb7ntU0C
> Wn0tRNrd/QagFm9Nyytm1g1IjoD/B+dXo9cT9p+bls/wBis4+jZZqJte40Kg1MaT
> TlUeyLqVqXMWoUyqqn7Rit4E5ejgPbQpPywdKlJKCQrW4OoU+ualW+t+LUrluPAQ
> ANQkenewaPmoEY4wLGJx02LeD8heYRGzVDkBMmohMiaSVgwibOfxcea7WiggcMNy
> HICqRz1rCHIhDa0togIb2YPSiVsz+7rqW6shUgFabpDV3c7edfaZNcu5KwW5laCk
> nY6A1S5hrgEOr3E8iPeK
> =mFFE
> -----END PGP SIGNATURE-----
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000001ab8b7056a49bd9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey Joe,<div dir=3D"auto"><br></div><div dir=3D"auto">May=
be we should patch the rpm for RHEL in some way? I can probably work around=
 the old iproute2 by doing a different ip-rule(8) trick, if you&#39;d be up=
 for shipping that.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Jaso=
n<br><br><div data-smartmail=3D"gmail_signature" dir=3D"auto">--<br>Sent fr=
om my telephone.<br></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Fri, Apr 20, 2018, 16:48 Aaron Jones &lt;<a href=3D"mailto:aa=
ronmdjones@gmail.com">aaronmdjones@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA256<br>
<br>
On 20/04/18 14:32, <a href=3D"mailto:bessonov.victor@e-queo.com" target=3D"=
_blank" rel=3D"noreferrer">bessonov.victor@e-queo.com</a> wrote:<br>
&gt; I&#39;ve tried to run this instruction manually, result is still the<b=
r>
&gt; same. The system runs CentOS 7 and properly updated.<br>
<br>
Updated, yes; but not up to date. The version of iproute2 is too old.<br>
<br>
-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v2<br>
Comment: Using GnuPG with Thunderbird - <a href=3D"http://www.enigmail.net/=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www.enigmail.net/<=
/a><br>
<br>
iQIcBAEBCAAGBQJa2f2dAAoJEIrwc3SIqzASCVMP/A9tBO8Sbl1z9rGK0q9vjdyK<br>
kMeFxKGVWqR4Xz8Sy9wfS+iKeXlBQxKukaZCTuSDr9WzsbpzvohYcE0FvGuDPZgf<br>
G9TgrGK9NAPow6pIdCfgeIIUnBQQ5geLtnxXKdrr7yaXn2rB8KWi1nwM+NbenNnC<br>
iJcPe7U9I+RzlDwESTHJMJJGR4hI8zbRSU4H3Nb2PEoYpizHUQuG56RGmOSDO08a<br>
1+uol4iBsR0EEBqyt3PUDjuSTjXSAm6G328pErC+aU6I9wP+FHsFUvfMnVd7GDG1<br>
mJfVx2R8mLInlWX0gpL9YgelOC+/jIRDOeNKvdQAoqF3+7Tz+mT7J++/FLdQa3Sq<br>
mgHaX+Tvjw6Rnl9KEYC9DqclmHuaoeAHtp7FGnxOXrSOE6fwVh/4BsfKKb7ntU0C<br>
Wn0tRNrd/QagFm9Nyytm1g1IjoD/B+dXo9cT9p+bls/wBis4+jZZqJte40Kg1MaT<br>
TlUeyLqVqXMWoUyqqn7Rit4E5ejgPbQpPywdKlJKCQrW4OoU+ualW+t+LUrluPAQ<br>
ANQkenewaPmoEY4wLGJx02LeD8heYRGzVDkBMmohMiaSVgwibOfxcea7WiggcMNy<br>
HICqRz1rCHIhDa0togIb2YPSiVsz+7rqW6shUgFabpDV3c7edfaZNcu5KwW5laCk<br>
nY6A1S5hrgEOr3E8iPeK<br>
=3DmFFE<br>
-----END PGP SIGNATURE-----<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000001ab8b7056a49bd9f--
