Return-Path: uberscubajim@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1faf6a1
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 12:43:25 +0000 (UTC)
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cce9e21
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 12:43:25 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id a137so2198187wma.0
 for <wireguard@lists.zx2c4.com>; Sun, 10 Sep 2017 06:09:23 -0700 (PDT)
Return-Path: <uberscubajim@gmail.com>
Subject: Re: Timing issue (?) with wg-quick up on Raspberry Pi B+
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
 <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
From: Jim Darby <uberscubajim@gmail.com>
Message-ID: <07621915-a53a-03f3-9c75-b7e7d188d109@gmail.com>
Date: Sun, 10 Sep 2017 14:09:21 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------710DCE46A8DFC7BEC3B2F47D"
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
--------------710DCE46A8DFC7BEC3B2F47D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

Thanks for the very quick response.

It happens with both the August and September snapshots. Kernel 4.9.35+, 
Raspbian based on Debian 9 and nothing odd in dmesg.

However, your comment about network management daemons running is most 
interesting. Here's an extract from journalctl's output:

    Sep 09 21:31:28 janus ifplugd(wg0)[6903]: ifplugd 0.28 initializing.
    Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Using interface
    wg0/00:00:00:00:00:00
    Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Using detection mode:
    IFF_RUNNING
    Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Initialization complete,
    link beat detected.
    Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Executing
    '/etc/ifplugd/ifplugd.action wg0 up'.
    Sep 09 21:31:28 janus ifplugd(wg0)[6903]: client: Ignoring unknown
    interface wg0=wg0.
    Sep 09 21:31:29 janus ifplugd(wg0)[6903]: Program executed successfully.

So, something is triggering ifplug. I'm unsure what it might be doing 
and it /seems/ to imply that it's ignoring it but maybe this is the 
cause of the problem. wg0 is /not/ mentioned in /etc/network/interfaces 
so maybe ifup is trying to be helpful? There may well be a race 
condition between ifup and wg-quick…

Regards,

Jim.



On 10/09/17 13:44, Jason A. Donenfeld wrote:
> Hey Jim,
>
> That's very odd indeed. Do you have any other network management
> daemons running on there that could be interfering?
>
> Also: what snapshot version, kernel version, distribution, etc are you
> using? Anything odd in dmesg after running wg-quick?
>
> Regards,
> Jason


--------------710DCE46A8DFC7BEC3B2F47D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000099" bgcolor="#FFFFFF">
    <p><font face="Verdana">Hi Jason,</font></p>
    <p><font face="Verdana">Thanks for the very quick response.</font></p>
    <p><font face="Verdana">It happens with both the August and September
        snapshots. Kernel 4.9.35+, Raspbian based on Debian 9 and
        nothing odd in dmesg.</font></p>
    <p><font face="Verdana">However, your comment about network
        management daemons running is most interesting. Here's an
        extract from journalctl's output:</font></p>
    <blockquote>
      <p><font face="Verdana">Sep 09 21:31:28 janus ifplugd(wg0)[6903]:
          ifplugd 0.28 initializing.<br>
          Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Using interface
          wg0/00:00:00:00:00:00<br>
          Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Using detection
          mode: IFF_RUNNING<br>
          Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Initialization
          complete, link beat detected.<br>
          Sep 09 21:31:28 janus ifplugd(wg0)[6903]: Executing
          '/etc/ifplugd/ifplugd.action wg0 up'.<br>
          Sep 09 21:31:28 janus ifplugd(wg0)[6903]: client: Ignoring
          unknown interface wg0=wg0.<br>
          Sep 09 21:31:29 janus ifplugd(wg0)[6903]: Program executed
          successfully.<br>
        </font></p>
    </blockquote>
    <p><font face="Verdana">So, something is triggering ifplug. I'm
        unsure what it might be doing and it <i>seems</i> to imply that
        it's ignoring it but maybe this is the cause of the problem. wg0
        is <i>not</i> mentioned in /etc/network/interfaces so maybe
        ifup is trying to be helpful? There may well be a race condition
        between ifup and wg-quick…</font></p>
    <p><font face="Verdana">Regards,</font></p>
    <p><font face="Verdana">Jim.<br>
      </font></p>
    <p><font face="Verdana"></font><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/09/17 13:44, Jason A. Donenfeld
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com">
      <pre wrap="">Hey Jim,

That's very odd indeed. Do you have any other network management
daemons running on there that could be interfering?

Also: what snapshot version, kernel version, distribution, etc are you
using? Anything odd in dmesg after running wg-quick?

Regards,
Jason
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------710DCE46A8DFC7BEC3B2F47D--
