Return-Path: eric@bluelinelabs.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9db1e2f
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 22:13:00 +0000 (UTC)
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c78800c2
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 22:13:00 +0000 (UTC)
Received: by mail-qt0-x232.google.com with SMTP id f18-v6so5633030qtp.10
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jul 2018 15:19:37 -0700 (PDT)
From: Eric Kuck <eric@bluelinelabs.com>
In-Reply-To: <CAHmME9qAUveJi6of9TMb_Owffsy-SX+4pQyDMHaz=6COE2CYxQ@mail.gmail.com>
References: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
 <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
 <CAMj-8hQFk_UPJO4-KEH8YvK5NOBH5vu23Vu5JM2Gt0srMD_kEg@mail.gmail.com>
 <CAHmME9qcXm65jFbGv24m-Pzx9c+nq2-D4y4kBkXk7W6u8HZLiw@mail.gmail.com>
 <CAMj-8hSnvCpY7sZ6xcH=2_Va33M1YsZ97H66PrDSo5=BV9vyOw@mail.gmail.com>
 <CAHmME9qQyw-GxJ-1mLNR_DaWspOO8Enc+gKWobvKUcLqZ-Phcg@mail.gmail.com>
 <72472182-2f17-ff6d-f76c-f0fa6c98d45e@sholland.org>
 <CAHmME9qAUveJi6of9TMb_Owffsy-SX+4pQyDMHaz=6COE2CYxQ@mail.gmail.com>
MIME-Version: 1.0
Date: Wed, 4 Jul 2018 18:19:36 -0400
Message-ID: <CAMj-8hSEgJv=TSfWBEhRTrbiQbtJauLed6miZcFtS03jDPOBZA@mail.gmail.com>
Subject: Re: Android app whitelist/blacklist feature
To: "Jason A. Donenfeld" <jason@zx2c4.com>,
 Samuel Holland <samuel@sholland.org>
Content-Type: multipart/alternative; boundary="000000000000778650057033d327"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000778650057033d327
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A first pass that only works with GoBackend has just been pushed. Feel free
to make suggestions or requests. This is the first time I=E2=80=99ve used
databinding for more than just a findViewById substitute, so it=E2=80=99s v=
ery
possible I didn=E2=80=99t do something canonically.


On July 3, 2018 at 1:17:27 PM, Jason A. Donenfeld (jason@zx2c4.com) wrote:

On Tue, Jul 3, 2018 at 8:12 PM Samuel Holland <samuel@sholland.org> wrote:
> Right, trying to make it a global setting requires either some sort of
> out-of-band way to pass the information to wg-quick, or rewriting the
> configuration file every time the tunnel is brought up.
>
> Since from netd's point of view, this is a per-network setting anyway, I
agree
> it makes sense to configure it per-tunnel. ExemptedApplications works as
a
> configuration key, though I prefer ExcludedApplications--the application
isn't
> just not required to use the tunnel, it's not allowed to use the tunnel.
>
> In that case, here are my UI suggestions:
> - Add a button in the editor that switches to a fragment or pops up a
Dialog
> similar to a MultiSelectListPreference.
> - For consistency, checked means excluded -- everything defaults to
unchecked.
> - The package names of excluded apps are put in the
> com.wireguard.config.Interface, and wg-quick handles package name to uid
> translation.
>
> How does that sound?

All of that sounds right-on to me, and I think you're right that
ExcludedApplications is the better key.

(This also provides a good basis for later adding a
"ExcludeLocalNetwork" option.)

Eric's git access should be all setup now, so we can watch the
commits coming on in.

--000000000000778650057033d327
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>body{font-family:Helvetica,Arial;font-size:13px}</style>=
</head><body style=3D"word-wrap:break-word"><div id=3D"bloop_customfont" st=
yle=3D"font-family:Helvetica,Arial;font-size:13px;color:rgba(0,0,0,1.0);mar=
gin:0px;line-height:auto">A first pass that only works with GoBackend has j=
ust been pushed. Feel free to make suggestions or requests. This is the fir=
st time I=E2=80=99ve used databinding for more than just a findViewById sub=
stitute, so it=E2=80=99s very possible I didn=E2=80=99t do something canoni=
cally.</div> <br> <div id=3D"bloop_sign_1530741231598432000" class=3D"bloop=
_sign"></div> <br><p class=3D"airmail_on">On July 3, 2018 at 1:17:27 PM, Ja=
son A. Donenfeld (<a href=3D"mailto:jason@zx2c4.com">jason@zx2c4.com</a>) w=
rote:</p> <blockquote type=3D"cite" class=3D"clean_bq"><span><div><div></di=
v><div>On Tue, Jul 3, 2018 at 8:12 PM Samuel Holland &lt;<a href=3D"mailto:=
samuel@sholland.org">samuel@sholland.org</a>&gt; wrote:
<br>&gt; Right, trying to make it a global setting requires either some sor=
t of
<br>&gt; out-of-band way to pass the information to wg-quick, or rewriting =
the
<br>&gt; configuration file every time the tunnel is brought up.
<br>&gt;
<br>&gt; Since from netd&#39;s point of view, this is a per-network setting=
 anyway, I agree
<br>&gt; it makes sense to configure it per-tunnel. ExemptedApplications wo=
rks as a
<br>&gt; configuration key, though I prefer ExcludedApplications--the appli=
cation isn&#39;t
<br>&gt; just not required to use the tunnel, it&#39;s not allowed to use t=
he tunnel.
<br>&gt;
<br>&gt; In that case, here are my UI suggestions:
<br>&gt; - Add a button in the editor that switches to a fragment or pops u=
p a Dialog
<br>&gt; similar to a MultiSelectListPreference.
<br>&gt; - For consistency, checked means excluded -- everything defaults t=
o unchecked.
<br>&gt; - The package names of excluded apps are put in the
<br>&gt; com.wireguard.config.Interface, and wg-quick handles package name =
to uid
<br>&gt; translation.
<br>&gt;
<br>&gt; How does that sound?
<br>
<br>All of that sounds right-on to me, and I think you&#39;re right that
<br>ExcludedApplications is the better key.
<br>
<br>(This also provides a good basis for later adding a
<br>&quot;ExcludeLocalNetwork&quot; option.)
<br>
<br> Eric&#39;s git access should be all setup now, so we can watch the
<br>commits coming on in.
<br></div></div></span></blockquote></body></html>

--000000000000778650057033d327--
