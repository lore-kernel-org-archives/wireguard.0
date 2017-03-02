Return-Path: developer@it-offshore.co.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e0c3f43
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 21:48:14 +0000 (UTC)
Received: from relay1001.mymailcheap.com (relay1001.mymailcheap.com
 [176.31.80.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36cceb31
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 21:48:13 +0000 (UTC)
Subject: Re: Wireguard added to Alpine Linux
References: <6b590394-3134-b725-a063-0993b32a51c4@it-offshore.co.uk>
 <CAHmME9ow_=3muSufX_--6JRG0Fz9qfyEPKi_=rc3tJUGr_CaAQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Stuart Cardall <developer@it-offshore.co.uk>
Message-ID: <02a8fddb-7246-984c-c51c-cd8fe3925694@it-offshore.co.uk>
Date: Thu, 2 Mar 2017 21:49:53 +0000
MIME-Version: 1.0
In-Reply-To: <CAHmME9ow_=3muSufX_--6JRG0Fz9qfyEPKi_=rc3tJUGr_CaAQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------450B3317D74FEA0488DAA423"
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
--------------450B3317D74FEA0488DAA423
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,

Wireguard can be added to Alpine with:

apk add wireguard-tools

The appropriate kernel module for linux-grsecor linux-vanillawill be
installed automatically. On the server it is probably necessary to:

echo wireguard >>/etc/modules&& rc-update add modules boot

A wireguard user mentioned on irc earlier today that everything is
working perfectly.

To monitor releases @ Alpine we use https://release-monitoring.org/ - if
it doesn't pick up the changes I'll subscribe.

Many thanks for the comments & review -
see https://github.com/alpinelinux/aports/pull/948 - they are fixed in
https://github.com/alpinelinux/aports/issues/954

If there is a step I was missing to correctly run `make check` I would
still like to run it in the future - perhaps it will pick up potential
issues from Alpine using musl libc (not glibc).

Kind Regards,

Stuart.




On 03/02/2017 03:33 PM, Jason A. Donenfeld wrote:
> Hey Stuart,
>
> Responding with the list CCd, since that's where people learn about
> wireguard related things. You might want to subscribe to it so you can
> get snapshot bump announcements.
>
> On Wed, Mar 1, 2017 at 10:36 PM, Stuart Cardall
> <developer@it-offshore.co.uk> wrote:
>> Just a quick courtesy email to let you know wireguard has been added t=
o
>> Alpine Linux.
> This is wonderful news! Thanks so much for doing this. I left a few
> small comments on the PR [1], which should be easy to address. Looking
> forward to testing this out.
>
> Could you send a tiny command stanza for wireguard.io/install/ so that
> I can put up an Alpine Linux section?
>
> Regards,
> Jason
>
> [1] https://github.com/alpinelinux/aports/pull/948#pullrequestreview-24=
756731


--------------450B3317D74FEA0488DAA423
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000099">
    <p><font face="Helvetica, Arial, sans-serif">Hi Jason,</font></p>
    <p><font face="Helvetica, Arial, sans-serif">Wireguard can be added
        to Alpine with:</font></p>
    <p><tt>apk a</tt><tt>dd wireguard-tools</tt><font face="Helvetica,
        Arial, sans-serif"><br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif">The appropriate kernel
        module for </font><tt>linux-grsec</tt><font face="Helvetica,
        Arial, sans-serif"> or </font><tt>linux-vanilla</tt><font
        face="Helvetica, Arial, sans-serif"> will be installed
        automatically. On the server it is probably necessary to:</font></p>
    <p><tt>echo wireguard &gt;&gt;</tt><tt> /etc/modules</tt><tt>
        &amp;&amp; rc-update add modules boot</tt><font face="Helvetica,
        Arial, sans-serif"><br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif">A wireguard user
        mentioned on irc earlier today that everything is working
        perfectly. <br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif">To monitor releases @
        Alpine we use <a href="https://release-monitoring.org/">https://release-monitoring.org/</a>
        - if it doesn't pick up the changes I'll subscribe.<br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif">Many thanks for the comments
        &amp; review - see <a
          href="https://github.com/alpinelinux/aports/pull/948">https://github.com/alpinelinux/aports/pull/948</a>
        - they are fixed in <a
          href="https://github.com/alpinelinux/aports/issues/954">https://github.com/alpinelinux/aports/issues/954</a></font></p>
    <p><font face="Helvetica, Arial, sans-serif">If there is a step I
        was missing to correctly run `</font><tt>make check</tt><font
        face="Helvetica, Arial, sans-serif">` I would still like to run
        it in the future - perhaps it will pick up potential issues from
        Alpine using musl libc (not glibc).</font></p>
    <p><font face="Helvetica, Arial, sans-serif">Kind Regards,</font></p>
    <p><font face="Helvetica, Arial, sans-serif">Stuart.<br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif"><br>
      </font></p>
    <p><font face="Helvetica, Arial, sans-serif"></font><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 03/02/2017 03:33 PM, Jason A.
      Donenfeld wrote:<br>
    </div>
    <blockquote
cite="mid:CAHmME9ow_=3muSufX_--6JRG0Fz9qfyEPKi_=rc3tJUGr_CaAQ@mail.gmail.com"
      type="cite">
      <pre wrap="">Hey Stuart,

Responding with the list CCd, since that's where people learn about
wireguard related things. You might want to subscribe to it so you can
get snapshot bump announcements.

On Wed, Mar 1, 2017 at 10:36 PM, Stuart Cardall
<a class="moz-txt-link-rfc2396E" href="mailto:developer@it-offshore.co.uk">&lt;developer@it-offshore.co.uk&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Just a quick courtesy email to let you know wireguard has been added to
Alpine Linux.
</pre>
      </blockquote>
      <pre wrap="">
This is wonderful news! Thanks so much for doing this. I left a few
small comments on the PR [1], which should be easy to address. Looking
forward to testing this out.

Could you send a tiny command stanza for wireguard.io/install/ so that
I can put up an Alpine Linux section?

Regards,
Jason

[1] <a class="moz-txt-link-freetext" href="https://github.com/alpinelinux/aports/pull/948#pullrequestreview-24756731">https://github.com/alpinelinux/aports/pull/948#pullrequestreview-24756731</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------450B3317D74FEA0488DAA423--
