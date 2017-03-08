Return-Path: developer@it-offshore.co.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ced342d
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 18:04:31 +0000 (UTC)
Received: from buffalo.ash.relay.mailchannels.net
 (buffalo.ash.relay.mailchannels.net [23.83.222.24])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aea41716
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 18:04:30 +0000 (UTC)
Subject: Re: Release monitoring (Was: Wireguard added to Alpine Linux)
References: <6b590394-3134-b725-a063-0993b32a51c4@it-offshore.co.uk>
 <CAHmME9ow_=3muSufX_--6JRG0Fz9qfyEPKi_=rc3tJUGr_CaAQ@mail.gmail.com>
 <02a8fddb-7246-984c-c51c-cd8fe3925694@it-offshore.co.uk>
 <20170308160529.GB21799@tuxmachine.polynome.dn42>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
From: Stuart Cardall <developer@it-offshore.co.uk>
Message-ID: <ff987f41-176f-be5c-fe15-4eb4ba9b8792@it-offshore.co.uk>
Date: Wed, 8 Mar 2017 18:05:16 +0000
MIME-Version: 1.0
In-Reply-To: <20170308160529.GB21799@tuxmachine.polynome.dn42>
Content-Type: multipart/alternative;
 boundary="------------9F4B3C459A28A2A7137ED1D9"
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
--------------9F4B3C459A28A2A7137ED1D9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Baptiste,

This was very helpful thank you - I've added email / irc notifications @
https://apps.fedoraproject.org/notifications for wireguard. I found the
easiest way to get a login was to use
https://admin.fedoraproject.org/accounts/user/new

To get notifications choose the following filter from the Anitya section:=


[[ Anything regarding a particular "upstream project"  ]]

& just enter wireguard as the project name.

Kind Regards,

Stuart.


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


--------------9F4B3C459A28A2A7137ED1D9
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
    <p><font face=3D"Helvetica, Arial, sans-serif">This was very helpful
        thank you - I've added email / irc notifications @ <a
          href=3D"https://apps.fedoraproject.org/notifications">https://a=
pps.fedoraproject.org/notifications</a>
        for wireguard. I found the easiest way to get a login was to use
        <a href=3D"https://admin.fedoraproject.org/accounts/user/new">htt=
ps://admin.fedoraproject.org/accounts/user/new</a><br>
      </font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif">To get notifications
        choose the following filter from the Anitya section:<br>
      </font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif">[[ Anything regarding =
a
        particular "upstream project"=A0 ]]<br>
      </font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif">&amp; just enter
        wireguard as the project name.</font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif">Kind Regards,</font></=
p>
    <p><font face=3D"Helvetica, Arial, sans-serif">Stuart.</font><br>
    </p>
    <br>
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

--------------9F4B3C459A28A2A7137ED1D9--
