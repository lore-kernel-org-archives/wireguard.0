Return-Path: eric@bluelinelabs.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67a636eb
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 00:16:21 +0000 (UTC)
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cba2718a
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 00:16:20 +0000 (UTC)
Received: by mail-qk0-x231.google.com with SMTP id u21-v6so110386qku.2
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jul 2018 17:22:43 -0700 (PDT)
From: Eric Kuck <eric@bluelinelabs.com>
In-Reply-To: <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
References: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
 <d939f3b9-ff51-4b94-fcdc-2e819a98459c@sholland.org>
MIME-Version: 1.0
Date: Mon, 2 Jul 2018 20:22:41 -0400
Message-ID: <CAMj-8hQFk_UPJO4-KEH8YvK5NOBH5vu23Vu5JM2Gt0srMD_kEg@mail.gmail.com>
Subject: Re: Android app whitelist/blacklist feature
To: Samuel Holland <samuel@sholland.org>, wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000fd9ed005700d4f1b"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000fd9ed005700d4f1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Excellent. I unfortunately haven=E2=80=99t done any C programming for almos=
t a
decade and have never done any kind of kernel development, so I=E2=80=99m n=
ot going
to be any help adding this functionality to the wg-quick implementation. If
I were to do the work I initially proposed (new fragment + GoBackend
implementation), would this be enough to get merged? If so, would it be
better if I simply disabled the new fragment for custom kernel users or if
I left a placeholder assuming someone else can add the missing
implementation?


On July 2, 2018 at 4:43:53 PM, Samuel Holland (samuel@sholland.org) wrote:

Hello Eric,

On 07/02/18 15:35, Eric Kuck wrote:
> I=E2=80=99d like to make a contribution to the Android app, but would lik=
e to
know if
> this is something that would actually get merged before I go through all
the
> effort. What I=E2=80=99d like to do is add an exceptions list (apps that =
will not
be
> routed through the Wireguard interface). The rationale for this being
that
> some apps simply don=E2=80=99t work with Wireguard. For example, the use =
of a
> Wireguard VPN with custom DNS breaks WearOS watches due to Google
hardcoding
> the use of the 8.8.8.8 DNS server. Another example is that Netflix
doesn=E2=80=99t
> work when routed through my VPN server since they know it=E2=80=99s a
DigitalOcean
> instance, but works fine without the VPN enabled. Another example is that
> there=E2=80=99s often no reason to route data-heavy video apps through yo=
ur VPN
> server. Rather than turning the VPN on my phone off to use my wearable or
to
> watch something on my phone, I=E2=80=99d like to be able to opt those app=
s out of
> using the VPN at all. I=E2=80=99m sure there are many more examples of ap=
ps that
> simply don=E2=80=99t need to go through a VPN, as no confidential informa=
tion is
> passed through them.

This sounds like a generally useful feature.

> My proposal is to add another Fragment that=E2=80=99s just a list of all =
apps
> installed on the phone with check boxes next to them. If the checkbox is
> checked, that app will be routed through Wireguard. If not, it will be
free
> to bypass the VPN. Naturally, all apps will be default to being checked.

If you base the UI on DialogPreference or MultiSelectListPreference,
Android
will take care of persisting the setting for you, and it would be easy to
add to
the settings page.

> This is an easy change to make for the GoBackend implementation using
> VpnService.Builder.addDisallowedApplication(<packageName>), but would
likely
> be pretty complicated to add to WgQuickBackend. Perhaps this is something
> that would only be possible for GoBackend users.

For WgQuickBackend, we'd need to modify the set_users function[1] in the
wg-quick "script" to take a dynamic list of user IDs instead of hard coding
it.
PackageManager should provide us the UIDs of other applications. I'm not
sure
the best way to communicate the ID list from the app to the script. Jason,
thoughts?

> Any thoughts on this? I have everything working locally by simply adding
> these two hardcoded lines to GoBackend.java:
>
> builder.addDisallowedApplication("com.netflix.mediaclient");
> builder.addDisallowedApplication("com.google.android.wearable.app=E2=80=
=9D);
>
> but I would like to make this more configurable and available to the rest
of
> Wireguard users if you=E2=80=99re agreeable to it. Thanks.

Thank you,
Samuel

[1]:
https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick/android.c?id=3Ddfd9=
827d5b08c506522bb3762cd3b0dbac640bbc#n291

--000000000000fd9ed005700d4f1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>body{font-family:Helvetica,Arial;font-size:13px}</style>=
</head><body style=3D"word-wrap:break-word"><div id=3D"bloop_customfont" st=
yle=3D"font-family:Helvetica,Arial;font-size:13px;color:rgba(0,0,0,1.0);mar=
gin:0px;line-height:auto">Excellent. I unfortunately haven=E2=80=99t done a=
ny C programming for almost a decade and have never done any kind of kernel=
 development, so I=E2=80=99m not going to be any help adding this functiona=
lity to the wg-quick implementation. If I were to do the work I initially p=
roposed (new fragment + GoBackend implementation), would this be enough to =
get merged? If so, would it be better if I simply disabled the new fragment=
 for custom kernel users or if I left a placeholder assuming someone else c=
an add the missing implementation?</div> <br> <div id=3D"bloop_sign_1530577=
058338650880" class=3D"bloop_sign"></div> <br><p class=3D"airmail_on">On Ju=
ly 2, 2018 at 4:43:53 PM, Samuel Holland (<a href=3D"mailto:samuel@sholland=
.org">samuel@sholland.org</a>) wrote:</p> <blockquote type=3D"cite" class=
=3D"clean_bq"><span><div><div></div><div>Hello Eric,
<br>
<br>On 07/02/18 15:35, Eric Kuck wrote:
<br>&gt; I=E2=80=99d like to make a contribution to the Android app, but wo=
uld like to know if
<br>&gt; this is something that would actually get merged before I go throu=
gh all the
<br>&gt; effort. What I=E2=80=99d like to do is add an exceptions list (app=
s that will not be
<br>&gt; routed through the Wireguard interface). The rationale for this be=
ing that =20
<br>&gt; some apps simply don=E2=80=99t work with Wireguard. For example, t=
he use of a =20
<br>&gt; Wireguard VPN with custom DNS breaks WearOS watches due to Google =
hardcoding =20
<br>&gt; the use of the 8.8.8.8 DNS server. Another example is that Netflix=
 doesn=E2=80=99t =20
<br>&gt; work when routed through my VPN server since they know it=E2=80=99=
s a DigitalOcean =20
<br>&gt; instance, but works fine without the VPN enabled. Another example =
is that =20
<br>&gt; there=E2=80=99s often no reason to route data-heavy video apps thr=
ough your VPN =20
<br>&gt; server. Rather than turning the VPN on my phone off to use my wear=
able or to =20
<br>&gt; watch something on my phone, I=E2=80=99d like to be able to opt th=
ose apps out of =20
<br>&gt; using the VPN at all. I=E2=80=99m sure there are many more example=
s of apps that =20
<br>&gt; simply don=E2=80=99t need to go through a VPN, as no confidential =
information is =20
<br>&gt; passed through them.
<br>
<br>This sounds like a generally useful feature.
<br>
<br>&gt; My proposal is to add another Fragment that=E2=80=99s just a list =
of all apps =20
<br>&gt; installed on the phone with check boxes next to them. If the check=
box is =20
<br>&gt; checked, that app will be routed through Wireguard. If not, it wil=
l be free =20
<br>&gt; to bypass the VPN. Naturally, all apps will be default to being ch=
ecked.
<br>
<br>If you base the UI on DialogPreference or MultiSelectListPreference, An=
droid
<br>will take care of persisting the setting for you, and it would be easy =
to add to
<br>the settings page.
<br>
<br>&gt; This is an easy change to make for the GoBackend implementation us=
ing =20
<br>&gt; VpnService.Builder.addDisallowedApplication(&lt;packageName&gt;), =
but would likely =20
<br>&gt; be pretty complicated to add to WgQuickBackend. Perhaps this is so=
mething =20
<br>&gt; that would only be possible for GoBackend users.
<br>
<br>For WgQuickBackend, we&#39;d need to modify the set_users function[1] i=
n the
<br>wg-quick &quot;script&quot; to take a dynamic list of user IDs instead =
of hard coding it.
<br>PackageManager should provide us the UIDs of other applications. I&#39;=
m not sure
<br>the best way to communicate the ID list from the app to the script. Jas=
on, thoughts?
<br>
<br>&gt; Any thoughts on this? I have everything working locally by simply =
adding =20
<br>&gt; these two hardcoded lines to GoBackend.java:
<br>&gt; =20
<br>&gt; builder.addDisallowedApplication(&quot;com.netflix.mediaclient&quo=
t;); =20
<br>&gt; builder.addDisallowedApplication(&quot;com.google.android.wearable=
.app=E2=80=9D);
<br>&gt; =20
<br>&gt; but I would like to make this more configurable and available to t=
he rest of
<br>&gt;  Wireguard users if you=E2=80=99re agreeable to it. Thanks.
<br>
<br>Thank you,
<br>Samuel
<br>
<br>[1]:
<br><a href=3D"https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick/andr=
oid.c?id=3Ddfd9827d5b08c506522bb3762cd3b0dbac640bbc#n291">https://git.zx2c4=
.com/WireGuard/tree/src/tools/wg-quick/android.c?id=3Ddfd9827d5b08c506522bb=
3762cd3b0dbac640bbc#n291</a>
<br></div></div></span></blockquote></body></html>

--000000000000fd9ed005700d4f1b--
