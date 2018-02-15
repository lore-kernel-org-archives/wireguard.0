Return-Path: e1326252@student.tuwien.ac.at
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5f898d5
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 00:27:17 +0000 (UTC)
Received: from mail1.student.tuwien.ac.at (mail1.student.tuwien.ac.at
 [193.170.73.221])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62f849db
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Feb 2018 00:27:17 +0000 (UTC)
Subject: Re: NetworkManager Plugin
To: Jordan DeBeer <debee1jp@gmail.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
 <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
 <CAFi5oX6LM+A=jbPmhffc4wT+pKmMg8xi=2ebSMg=s7Qg2AY_sw@mail.gmail.com>
From: Maximilian Moser <e1326252@student.tuwien.ac.at>
Message-ID: <cba131ba-cd15-8bf4-cdd1-4d46ad774d41@student.tuwien.ac.at>
Date: Thu, 15 Feb 2018 01:34:08 +0100
MIME-Version: 1.0
In-Reply-To: <CAFi5oX6LM+A=jbPmhffc4wT+pKmMg8xi=2ebSMg=s7Qg2AY_sw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------9D8DDADF8C005BA0C7FE7CC0"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------9D8DDADF8C005BA0C7FE7CC0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Whoa, I actually kind of expected some response like "yeah nice, but
we've already done that plugin, so you can go home again"
I actually just wanted to get this thesis over with and thought, why not
post the result to the mailing list and see if anybody is still intereste=
d?

So I'm somewhat excited about the acceptance and the possible prospect
of this thing getting packaged for distros :D


Regarding the issues... About some of them, I did know in one way or the
other.
E.g. the Endpoint section only accepting IPs -- this one goes even
further: you also can't have an IP6 in square brackets as is usually
required for specification of ports; only hex digits, colons and maybe a
subnet postfix.
Also, the conf parsing part splits the input primarily by whitespaces,
so it'll give you an error if you have something like
"AllowedIPs=3D0.0.0.0/0" instead of "AllowedIPs =3D 0.0.0.0/0" in any lin=
e.

Most of the others were however issues that I hadn't thought of; maybe
it would be smart to put up some issue tracking and post them there? I'm
sure to forget half of them in about a week.


> The DNS field under Identity does not currently function.=C2=A0 I am no=
t
> sure how you want to handle this field as NetworkManager has their own
> DNS field under the IPv4 tab in the GUI.
Yeah, that might be one conceptual challenge which I didn't really want
to face: Deciding which parts would be more appropriate in the IPv4 /
IPv6 tabs of the UI (which are not so easy to get rid of, if this is
possible at all).
Alongside the DNS, it might (or might not) make sense to put the
[Interface] Address into those tabs, and if possible, the [Peer]
Endpoint too... But I think it might also cause more confusion among
users if those settings are split up than it would help.

> and the last thing I noticed: the Private Key section is required.=C2=A0=

> This breaks functionality if you were to have your private key stored
> in a password manager.=C2=A0 This is solvable by just pasting a properl=
y
> formatted key (I just used my public key) into the field and adding a
> Post Up script to grab the private key string.
I think the private key falls into the category of "secrets" instead of
"data items", so that might require an overhaul generally.
In the current version, secrets aren't used at all - which makes the
auth-dialog currently superfluous.
Making the private key into a secret might also legitimate the actual
use of the auth-dialog, since its job is primarily searching through
whereever (e.g. keyring or just plain asking the user via a dialog,
hence the name) and look if it can find the required secrets.

In the near future, I'll probably focus more on the written part of the
thesis, so fixing the issues will probably have to wait a while on my par=
t.


> This adds quite a bit of value to Wireguard imo so glad to see you
> worked on this.=C2=A0 Thank you!=C2=A0=20
Thank you for your interest and actually testing it on another system ;)


Best regards,
Max


On 14.02.2018 17:58, Jordan DeBeer wrote:
> Hello Max,
>
> I went ahead and tested this on Fedora 27 w/ NetworkManager
> 1.8.6-1.fc27 and was able to get it working.=C2=A0 A few things I notic=
ed:
>
> Starting the VPN with SELinux enabled results in a number of alerts.=C2=
=A0
> Mostly for the sysctl source process.=C2=A0 This is to be expected as y=
ou
> mentioned you were testing on Arch.=C2=A0 If this ever ends up getting
> packaged for Fedora the policies can probably be added to the RPM.
>
> The DNS field under Identity does not currently function.=C2=A0 I am no=
t
> sure how you want to handle this field as NetworkManager has their own
> DNS field under the IPv4 tab in the GUI.
>
> The Endpoint section of the GUI only accepts IP addresses and not FQDNs=
=2E
>
> and the last thing I noticed: the Private Key section is required.=C2=A0=

> This breaks functionality if you were to have your private key stored
> in a password manager.=C2=A0 This is solvable by just pasting a properl=
y
> formatted key (I just used my public key) into the field and adding a
> Post Up script to grab the private key string.
>
> I am going to keep playing around with this and possibly work on
> packaging it into an RPM.=C2=A0
>
> This adds quite a bit of value to Wireguard imo so glad to see you
> worked on this.=C2=A0 Thank you!=C2=A0
>
> Cheers,
> Jordan DeBeer
>
> On Wed, Feb 14, 2018 at 10:28 AM, Jason A. Donenfeld <Jason@zx2c4.com
> <mailto:Jason@zx2c4.com>> wrote:
>
>     Hey Max,
>
>     This is wonderful news. I'm happy to work with you to make sure thi=
s
>     comes out perfectly, and maybe when it's finished we can submit it
>     upstream to NetworkManager, similar to how systemd-networkd now has=

>     WireGuard support built-in.
>
>     The biggest hurdle I currently see is entirely removing the depende=
ncy
>     on wg-quick and wg, and talking Netlink yourself to the kernel, jus=
t
>     like systemd-networkd does. It shouldn't be too hard to adopt the
>     libmnl-based code in wg(8) to be suitable for your usage; I can ass=
ist
>     with this. In general, the fwmark/routing logic of wg-quick should
>     probably be done in a NetworkManager-centric way, which means not
>     using wg-quick.
>
>     Looks like things are off to a great start!
>
>     Jason
>     _______________________________________________
>     WireGuard mailing list
>     WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>     https://lists.zx2c4.com/mailman/listinfo/wireguard
>     <https://lists.zx2c4.com/mailman/listinfo/wireguard>
>
>


--------------9D8DDADF8C005BA0C7FE7CC0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Whoa, I actually kind of expected some response like "yeah nice,
      but we've already done that plugin, so you can go home again"<br>
      I actually just wanted to get this thesis over with and thought,
      why not post the result to the mailing list and see if anybody is
      still interested?<br>
    </p>
    <p>So I'm somewhat excited about the acceptance and the possible
      prospect of this thing getting packaged for distros :D</p>
    <p><br>
    </p>
    <p>Regarding the issues... About some of them, I did know in one way
      or the other.<br>
      E.g. the Endpoint section only accepting IPs -- this one goes even
      further: you also can't have an IP6 in square brackets as is
      usually required for specification of ports; only hex digits,
      colons and maybe a subnet postfix.<br>
      Also, the conf parsing part splits the input primarily by
      whitespaces, so it'll give you an error if you have something like
      "AllowedIPs=0.0.0.0/0" instead of "AllowedIPs = 0.0.0.0/0" in any
      line.<br>
    </p>
    <p>Most of the others were however issues that I hadn't thought of;
      maybe it would be smart to put up some issue tracking and post
      them there? I'm sure to forget half of them in about a week.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite">The DNS field under Identity does not
      currently function.  I am not sure how you want to handle this
      field as NetworkManager has their own DNS field under the IPv4 tab
      in the GUI.<br>
    </blockquote>
    Yeah, that might be one conceptual challenge which I didn't really
    want to face: Deciding which parts would be more appropriate in the
    IPv4 / IPv6 tabs of the UI (which are not so easy to get rid of, if
    this is possible at all).<br>
    Alongside the DNS, it might (or might not) make sense to put the
    [Interface] Address into those tabs, and if possible, the [Peer]
    Endpoint too... But I think it might also cause more confusion among
    users if those settings are split up than it would help.<br>
    <br>
    <blockquote type="cite">and the last thing I noticed: the Private
      Key section is required.  This breaks functionality if you were to
      have your private key stored in a password manager.  This is
      solvable by just pasting a properly formatted key (I just used my
      public key) into the field and adding a Post Up script to grab the
      private key string.</blockquote>
    I think the private key falls into the category of "secrets" instead
    of "data items", so that might require an overhaul generally.<br>
    In the current version, secrets aren't used at all - which makes the
    auth-dialog currently superfluous.<br>
    Making the private key into a secret might also legitimate the
    actual use of the auth-dialog, since its job is primarily searching
    through whereever (e.g. keyring or just plain asking the user via a
    dialog, hence the name) and look if it can find the required
    secrets.<br>
    <br>
    In the near future, I'll probably focus more on the written part of
    the thesis, so fixing the issues will probably have to wait a while
    on my part.<br>
    <p><br>
    </p>
    <p> </p>
    <blockquote type="cite">This adds quite a bit of value to Wireguard
      imo so glad to see you worked on this.  Thank you!  </blockquote>
    Thank you for your interest and actually testing it on another
    system ;)<br>
    <p><br>
    </p>
    <p>Best regards,<br>
      Max<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 14.02.2018 17:58, Jordan DeBeer
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFi5oX6LM+A=jbPmhffc4wT+pKmMg8xi=2ebSMg=s7Qg2AY_sw@mail.gmail.com">
      <div dir="ltr">
        <div>
          <div>
            <div>
              <div>
                <div>
                  <div>
                    <div>
                      <div>
                        <div>Hello Max,<br>
                          <br>
                        </div>
                        I went ahead and tested this on Fedora 27 w/
                        NetworkManager 1.8.6-1.fc27 and was able to get
                        it working.  A few things I noticed:<br>
                      </div>
                      <br>
                      Starting the VPN with SELinux enabled results in a
                      number of alerts.  Mostly for the sysctl source
                      process.  This is to be expected as you mentioned
                      you were testing on Arch.  If this ever ends up
                      getting packaged for Fedora the policies can
                      probably be added to the RPM.<br>
                      <br>
                    </div>
                    The DNS field under Identity does not currently
                    function.  I am not sure how you want to handle this
                    field as NetworkManager has their own DNS field
                    under the IPv4 tab in the GUI.<br>
                    <br>
                  </div>
                  The Endpoint section of the GUI only accepts IP
                  addresses and not FQDNs.<br>
                  <br>
                </div>
                and the last thing I noticed: the Private Key section is
                required.  This breaks functionality if you were to have
                your private key stored in a password manager.  This is
                solvable by just pasting a properly formatted key (I
                just used my public key) into the field and adding a
                Post Up script to grab the private key string.<br>
                <br>
              </div>
              I am going to keep playing around with this and possibly
              work on packaging it into an RPM.  <br>
              <br>
            </div>
            This adds quite a bit of value to Wireguard imo so glad to
            see you worked on this.  Thank you!  <br>
            <br>
          </div>
          Cheers,<br>
        </div>
        Jordan DeBeer<br>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Wed, Feb 14, 2018 at 10:28 AM, Jason
          A. Donenfeld <span dir="ltr">&lt;<a
              href="mailto:Jason@zx2c4.com" target="_blank"
              moz-do-not-send="true">Jason@zx2c4.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Hey Max,<br>
            <br>
            This is wonderful news. I'm happy to work with you to make
            sure this<br>
            comes out perfectly, and maybe when it's finished we can
            submit it<br>
            upstream to NetworkManager, similar to how systemd-networkd
            now has<br>
            WireGuard support built-in.<br>
            <br>
            The biggest hurdle I currently see is entirely removing the
            dependency<br>
            on wg-quick and wg, and talking Netlink yourself to the
            kernel, just<br>
            like systemd-networkd does. It shouldn't be too hard to
            adopt the<br>
            libmnl-based code in wg(8) to be suitable for your usage; I
            can assist<br>
            with this. In general, the fwmark/routing logic of wg-quick
            should<br>
            probably be done in a NetworkManager-centric way, which
            means not<br>
            using wg-quick.<br>
            <br>
            Looks like things are off to a great start!<br>
            <br>
            Jason<br>
            ______________________________<wbr>_________________<br>
            WireGuard mailing list<br>
            <a href="mailto:WireGuard@lists.zx2c4.com"
              moz-do-not-send="true">WireGuard@lists.zx2c4.com</a><br>
            <a href="https://lists.zx2c4.com/mailman/listinfo/wireguard"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.zx2c4.com/<wbr>mailman/listinfo/wireguard</a><br>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------9D8DDADF8C005BA0C7FE7CC0--
