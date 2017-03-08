Return-Path: developer@it-offshore.co.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a900b1c4
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 17:11:23 +0000 (UTC)
Received: from blue.oak.relay.mailchannels.net
 (blue.oak.relay.mailchannels.net [23.83.215.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e94674e
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 17:11:22 +0000 (UTC)
Subject: Re: Release monitoring (Was: Wireguard added to Alpine Linux)
References: <6b590394-3134-b725-a063-0993b32a51c4@it-offshore.co.uk>
 <CAHmME9ow_=3muSufX_--6JRG0Fz9qfyEPKi_=rc3tJUGr_CaAQ@mail.gmail.com>
 <02a8fddb-7246-984c-c51c-cd8fe3925694@it-offshore.co.uk>
 <20170308160529.GB21799@tuxmachine.polynome.dn42>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
From: Stuart Cardall <developer@it-offshore.co.uk>
Message-ID: <12a6f6bf-7285-4d73-1518-c1feb0fc2539@it-offshore.co.uk>
Date: Wed, 8 Mar 2017 17:12:12 +0000
MIME-Version: 1.0
In-Reply-To: <20170308160529.GB21799@tuxmachine.polynome.dn42>
Content-Type: multipart/alternative;
 boundary="------------51C1ACD7316AC3C370AF2765"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: developer@it-offshore.co.uk
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------51C1ACD7316AC3C370AF2765
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Baptiste,

Many thanks for your message - I will add a distribution mapping for
Alpine Linux once Wireguard has moved out of testing.

In Alpine we monitor releases directly with http://fedmsg.com - when a
new notification with an Alpine mapping is received, it creates a flag
in the Aports application. The package maintainer then receives an email
about the outdated package from Aports, in the same way as when someone
manually flags the pkg as outdated on https://pkgs.alpinelinux.org/packag=
es

Kind Regards,

Stuart


On 03/08/2017 04:05 PM, Baptiste Jonglez wrote:
> Hi Stuart,
>
> On Thu, Mar 02, 2017 at 09:49:53PM +0000, Stuart Cardall wrote:
>> To monitor releases @ Alpine we use https://release-monitoring.org/ - =
if
>> it doesn't pick up the changes I'll subscribe.
> Thanks for mentioning this, it's a nice tool!  I started using it for
> other projects.  By the way, receiving notification emails is non-obvio=
us:
> you have to register on https://apps.fedoraproject.org/notifications an=
d
> add a filter that matches the upstream projects you are interested in.
>
> I just added wireguard [1], the monitoring system is configured to scra=
pe
> https://git.zx2c4.com/WireGuard/ and look for "WireGuard-([\d\.]*).tar.=
xz"
> to extract a version number.
>
> Baptiste
>
> [1] https://release-monitoring.org/project/13481/


--------------51C1ACD7316AC3C370AF2765
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000099">
    <p><font face=3D"Helvetica, Arial, sans-serif">Hi Baptiste,</font></p=
>
    <p><font face=3D"Helvetica, Arial, sans-serif">Many thanks for your
        message - I will add a distribution mapping for Alpine Linux
        once Wireguard has moved out of testing.</font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif">In Alpine we monitor
        releases directly with <a href=3D"http://fedmsg.com">http://fedms=
g.com</a>
        - when a new notification with an Alpine mapping is received, it
        creates a flag in the Aports application. The package maintainer
        then receives an email about the outdated package from Aports,
        in the same way as when someone manually flags the pkg as
        outdated on <a href=3D"https://pkgs.alpinelinux.org/packages">htt=
ps://pkgs.alpinelinux.org/packages</a><br>
      </font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif">Kind Regards,</font></=
p>
    <p><font face=3D"Helvetica, Arial, sans-serif">Stuart</font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif"><br>
      </font></p>
    <div class=3D"moz-cite-prefix">On 03/08/2017 04:05 PM, Baptiste
      Jonglez wrote:<br>
    </div>
    <blockquote
      cite=3D"mid:20170308160529.GB21799@tuxmachine.polynome.dn42"
      type=3D"cite">
      <pre wrap=3D"">Hi Stuart,

On Thu, Mar 02, 2017 at 09:49:53PM +0000, Stuart Cardall wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">To monitor releases @ Alpine we use <a class=3D"mo=
z-txt-link-freetext" href=3D"https://release-monitoring.org/">https://rel=
ease-monitoring.org/</a> - if
it doesn't pick up the changes I'll subscribe.
</pre>
      </blockquote>
      <pre wrap=3D"">
Thanks for mentioning this, it's a nice tool!  I started using it for
other projects.  By the way, receiving notification emails is non-obvious=
:
you have to register on <a class=3D"moz-txt-link-freetext" href=3D"https:=
//apps.fedoraproject.org/notifications">https://apps.fedoraproject.org/no=
tifications</a> and
add a filter that matches the upstream projects you are interested in.

I just added wireguard [1], the monitoring system is configured to scrape
<a class=3D"moz-txt-link-freetext" href=3D"https://git.zx2c4.com/WireGuar=
d/">https://git.zx2c4.com/WireGuard/</a> and look for "WireGuard-([\d\.]*=
).tar.xz"
to extract a version number.

Baptiste

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://release-monitoring=
.org/project/13481/">https://release-monitoring.org/project/13481/</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------51C1ACD7316AC3C370AF2765--
