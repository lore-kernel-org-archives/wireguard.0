Return-Path: <SRS0=xsnz=MW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02245C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Oct 2018 14:52:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B0C52087A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Oct 2018 14:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="QEjsIYjY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B0C52087A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98ebb7ee;
	Wed, 10 Oct 2018 14:51:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3ef1ebb
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Oct 2018 14:51:23 +0000 (UTC)
Received: from sonic306-20.consmr.mail.ir2.yahoo.com
 (sonic306-20.consmr.mail.ir2.yahoo.com [77.238.176.206])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6232b27a
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Oct 2018 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1539183143; bh=KFp4p1Qh4JWAEJ7/APq34MgJO1GIvwmsuFOkbxu6MAA=;
 h=Subject:To:References:From:Date:In-Reply-To:From:Subject;
 b=QEjsIYjY8eC5Gn731HWyZuuzFNTLWeXH1gAmkxWAgZbfWUiGUSaEx9hJ10LMvYTpYiuEL5G9cCfTVSL6zJkWwOj/HVtp74aDL8QobJVZoD067tyhQUTesQ8j0HoCcNHaAvkrcDhjDhkcMKirPOwotfMNGVqLMbIoRQcacu3gEZ25unmQwU9nMscfgc8vcRTUU1wZRT/KPOwSVokSL3YhzSY3euvkGd1WxKAQP6LdxKX1Ku0L6Is45mELqIte8BCAAmL2248/V3vl0briY8L49um4zWMNjHDHy41q61AtocZO/9LZ+wNt56/DRV2YnKwjGbMEWG+vjD5hfp7k+DR8zQ==
X-YMail-OSG: wL1Tcc4VM1l9Pb7GSrb.61caQ9TIQ3rd48FuR_bAody92etmfQ0N2hjAsTgBxnB
 Z0BA.t_i_RddJXaHcs7BnqV0nCWnNpi2.9c2yWMGk61MTn0ifLth.bEXzPvC.07wVybZfTa_ywqL
 0dXHOiSOj9W_2JOcGv_Yaxm9RHvRYfJgQRXg7eDZW8xvtqPFf3dKUyeN747wFuIUKYHbfMZs3Wzz
 BT6bfkHnkKnYqQMQnbEf6RNyytqnbLjwhdFO12EQGxHsZAqIvrzXsLtKxhj8KTgj3kLV03EMU9Xy
 V1yFhfZB5Gj2WWuxCmlN8kAHs43mQjSVXgtcAdjKm5j7GCD3YoEGmHX4CcaE2vjPXD4ZzHlckcCe
 VDjSIVElqmeBVvFJDA3llt1Fmd2I2pLLW37uPtBVRkMvtws7f6mApw.mCxdVMye1dqE4eFRDqYVG
 WhR289T6RH8XYsEWttglV2Rum9qyB2JoDzDImNLoig1e8uUM1aOllNVFOg11g78jOyB7cfPvhFfw
 olaMILUCfu9DOWeMuWqe3s0uTnVvA3YYV1cTrin7sUWHNLdJm3c5Wxfe7CZhbGHWYviLQtvOn7pb
 Ks9ZcfBrxCaxSgXdCZMh7bA86R9CR.G.AiTHfybm.iSJthgZeFSUnj9oxmDkFzfxnCmD7MXUDiR1
 lolc49.RPjhKu3LG_Vd4Pj4RQa.PAqnQtJg1WuWyq0lyaUJC8Oh9Nfp6vZyEw0_ABgJrWr0RoVHv
 fsaIbDBAdoXxcblTGl1aE1lD77yJP2_FkynwwD_JQAq35a5Cv6aOpAoMUfQKmYueKTZRrkNTuBi4
 yvmOm.R.sSBlbHAtidTMAXYNPW_9uMaodDipPXm8H3aeAjzUyQBcy3M4Qn5RG7ha.Ml3UwADi_Sr
 ustk6003VenYKQbmaXqAPhBWGyETLLJNdL7hUeOhuc3_WYhKJPfyeEN8CvHf2bvD474wmvs9nlP2
 1TtlrRc.Ymu77p268uhsNMZcklXOzVNpb_XoUcJnixgwPaVq2eLmpPlK1J8kVUMpdmGUGA_CZccD
 XnsbbbqS6q0coO2zbkDOplSV_qFP2XVvlM42zrbwf0Z3W_Ohwq2w-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ir2.yahoo.com with HTTP; Wed, 10 Oct 2018 14:52:23 +0000
Received: from 82-197-199-141.dsl.cambrium.nl (EHLO [192.168.20.251])
 ([82.197.199.141])
 by smtp419.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 7a34e9c9cdc2bf07c12921bac8a31caf for <wireguard@lists.zx2c4.com>;
 Wed, 10 Oct 2018 14:52:21 +0000 (UTC)
Subject: Re: Wireguard not coming up on DD-wrt
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com>
 <796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de>
 <18dc8d48-b5e9-7ce6-844b-d43af06c6af7@yahoo.com>
 <08ebe77e-c66f-a356-8a42-e0a0d920a2a8@newmedia-net.de>
 <2cee2aba-17a6-44dc-0598-24fdb8d50408@yahoo.com>
 <b6289282-309d-9e23-a31f-4960872ab522@newmedia-net.de>
From: "Dennis van J." <dennis_20@yahoo.com>
Message-ID: <b0228925-ae68-cc86-647a-b67014eeb3dc@yahoo.com>
Date: Wed, 10 Oct 2018 16:52:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b6289282-309d-9e23-a31f-4960872ab522@newmedia-net.de>
Content-Language: nl
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6934586842182968623=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============6934586842182968623==
Content-Type: multipart/alternative;
 boundary="------------32CC12FF41586610590708F1"
Content-Language: nl

This is a multi-part message in MIME format.
--------------32CC12FF41586610590708F1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Thanks, we have not tried that yet, but certainly something to do. Have
to do it later next week though. I'll let the list know how that went.


Dennis


Op 10-10-2018 om 16:44 schreef Sebastian Gottschall:
>
> okay. this is mips32 big endian and i also have this device for
> testing. have you also tried a more recent version to ensure that its
> no regression with some sort of wireguard version?
> you may also start a private conversation on my email direct to check
> if the keys you used are all correct. so maybe a private teamviewer
> session etc if you are willing to . personally i tried already
> connections between 2 dd-wrt devices without any issues so far
>
>
> Sebastian
>
> Am 10.10.2018 um 15:31 schrieb Dennis van J.:
>>
>> It is running on a TP-LINK WDR-4300 (v1).
>>
>>
>> Op 10-10-2018 om 09:06 schreef Sebastian Gottschall:
>>>
>>>
>>> Am 10.10.2018 um 08:00 schrieb Dennis van J.:
>>>>
>>>> Hi Sebastian,
>>>>
>>>> I took care of the FW problems. An iptables --list shows that the
>>>> udp port is open.
>>>>
>>>> DD-wrt is running using: Firmware:DD-WRT v3.0-r36645 std (08/19/18).
>>>>
>>> okay and finally. which hardware do you run it?
>>>>
>>>> Cheers,
>>>>
>>>> Dennis
>>>>
>>>>
>>>> Op 9-10-2018 om 18:29 schreef Sebastian Gottschall:
>>>>>
>>>>> just to make sure. since i'm updating wireguard in dd-wrt very
>>>>> often to the latest state of art code from git. which dd-wrt
>>>>> version did you use for establishing the connection?
>>>>>
>>>>> did you also take care about usual firewall problems? by default
>>>>> the the firewall is closed on wan, so no inbound connection is
>>>>> possible
>>>>>
>>>>>
>>>>> Sebastian
>>>>>
>>>>> Am 09.10.2018 um 17:06 schrieb Dennis van J.:
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> I have setup Wireguard on a Gentoo box, compiled it into the
>>>>>> kernel using instructions on the wireguard website. Got my mobile
>>>>>> to connect using 4G to this box fine, so I wanted to test further
>>>>>> with a friend of mine who has a DD-wrt installation on his
>>>>>> router. Wireguard is integrated into the DD-wrt build, we set it
>>>>>> up, but the tunnel does not come up. On the server I only see this:
>>>>>>
>>>>>> Oct  9 16:45:34 omega kernel: [178809.449718] wireguard: wg0:
>>>>>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:34 omega kernel: [178809.449721] wireguard: wg0:
>>>>>> Sending handshake response to peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:34 omega kernel: [178809.450130] wireguard: wg0:
>>>>>> Keypair 32179 destroyed for peer 10
>>>>>> Oct  9 16:45:34 omega kernel: [178809.450131] wireguard: wg0:
>>>>>> Keypair 32180 created for peer 10
>>>>>> Oct  9 16:45:39 omega kernel: [178814.519668] wireguard: wg0:
>>>>>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:39 omega kernel: [178814.519671] wireguard: wg0:
>>>>>> Sending handshake response to peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:39 omega kernel: [178814.520062] wireguard: wg0:
>>>>>> Keypair 32180 destroyed for peer 10
>>>>>> Oct  9 16:45:39 omega kernel: [178814.520063] wireguard: wg0:
>>>>>> Keypair 32181 created for peer 10
>>>>>> Oct  9 16:45:44 omega kernel: [178819.579701] wireguard: wg0:
>>>>>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:44 omega kernel: [178819.579704] wireguard: wg0:
>>>>>> Sending handshake response to peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:44 omega kernel: [178819.580094] wireguard: wg0:
>>>>>> Keypair 32181 destroyed for peer 10
>>>>>> Oct  9 16:45:44 omega kernel: [178819.580095] wireguard: wg0:
>>>>>> Keypair 32182 created for peer 10
>>>>>> Oct  9 16:45:50 omega kernel: [178824.910142] wireguard: wg0:
>>>>>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:50 omega kernel: [178824.910145] wireguard: wg0:
>>>>>> Sending handshake response to peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:50 omega kernel: [178824.910535] wireguard: wg0:
>>>>>> Keypair 32182 destroyed for peer 10
>>>>>> Oct  9 16:45:50 omega kernel: [178824.910536] wireguard: wg0:
>>>>>> Keypair 32183 created for peer 10
>>>>>> Oct  9 16:45:55 omega kernel: [178829.950001] wireguard: wg0:
>>>>>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:55 omega kernel: [178829.950003] wireguard: wg0:
>>>>>> Sending handshake response to peer 10 (x.169.86.x:22300)
>>>>>> Oct  9 16:45:55 omega kernel: [178829.950406] wireguard: wg0:
>>>>>> Keypair 32183 destroyed for peer 10
>>>>>> Oct  9 16:45:55 omega kernel: [178829.950407] wireguard: wg0:
>>>>>> Keypair 32184 created for peer 10
>>>>>>
>>>>>> Port on the server is open (since the 4G test works). We can
>>>>>> reach the 22300 port on his side. Checked the pub/private keys as
>>>>>> well.
>>>>>>
>>>>>> wg show on server:
>>>>>>
>>>>>> interface: wg0
>>>>>>   public key: <pubkey server>
>>>>>>   private key: (hidden)
>>>>>>   listening port: 51820
>>>>>>
>>>>>> peer: <pubkey of mobile>
>>>>>>   endpoint: x.200.39.x:8971
>>>>>>   allowed ips: 0.0.0.0/0
>>>>>>   latest handshake: 8 hours, 1 minute, 43 seconds ago
>>>>>>   transfer: 384.24 KiB received, 2.74 MiB sent
>>>>>>
>>>>>> peer: <pubkey of dd-wrt>
>>>>>>   endpoint: x.169.86.x:22300
>>>>>>   allowed ips: 192.168.1.0/24, 10.100.0.3/32
>>>>>>   transfer: 2.00 MiB received, 1.24 MiB sent
>>>>>>
>>>>>> On DD-wrt router:
>>>>>>
>>>>>> interface: oet1
>>>>>>   public key: <pubkey dd-wrt>
>>>>>>   private key: (hidden)
>>>>>>   listening port: 22300
>>>>>>
>>>>>> peer: <pubkey of server>
>>>>>>   endpoint: x.197.199.x:51820
>>>>>>   allowed ips: 0.0.0.0/0
>>>>>>   transfer: 0 B received, 777.43 KiB sent
>>>>>>   persistent keepalive: every 25 seconds
>>>>>>
>>>>>> We are trying to get logging to work on that DD-wrt box, that
>>>>>> should contain some more clues but maybe any of you have an idea?
>>>>>>
>>>>>> Cheers,
>>>>>>
>>>>>> Dennis
>>>>>>
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> WireGuard mailing list
>>>>>> WireGuard@lists.zx2c4.com
>>>>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>>>
>>>>
>>>> _______________________________________________
>>>> WireGuard mailing list
>>>> WireGuard@lists.zx2c4.com
>>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard


--------------32CC12FF41586610590708F1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Verdana">Thanks, we have not tried that yet, but
        certainly something to do. Have to do it later next week though.
        I'll let the list know how that went.</font></p>
    <p><font face="Verdana"><br>
      </font></p>
    <p><font face="Verdana">Dennis</font><br>
    </p>
    <br>
    <div class="moz-cite-prefix">Op 10-10-2018 om 16:44 schreef
      Sebastian Gottschall:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b6289282-309d-9e23-a31f-4960872ab522@newmedia-net.de">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p>okay. this is mips32 big endian and i also have this device for
        testing. have you also tried a more recent version to ensure
        that its no regression with some sort of wireguard version?<br>
        you may also start a private conversation on my email direct to
        check if the keys you used are all correct. so maybe a private
        teamviewer session etc if you are willing to . personally i
        tried already connections between 2 dd-wrt devices without any
        issues so far</p>
      <p><br>
      </p>
      <p>Sebastian<br>
      </p>
      <div class="moz-cite-prefix">Am 10.10.2018 um 15:31 schrieb Dennis
        van J.:<br>
      </div>
      <blockquote type="cite"
        cite="mid:2cee2aba-17a6-44dc-0598-24fdb8d50408@yahoo.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=utf-8">
        <p><font face="Verdana">It is running on a TP-LINK WDR-4300
            (v1).</font><br>
        </p>
        <br>
        <div class="moz-cite-prefix">Op 10-10-2018 om 09:06 schreef
          Sebastian Gottschall:<br>
        </div>
        <blockquote type="cite"
          cite="mid:08ebe77e-c66f-a356-8a42-e0a0d920a2a8@newmedia-net.de">
          <meta http-equiv="Content-Type" content="text/html;
            charset=utf-8">
          <p><br>
          </p>
          <div class="moz-cite-prefix">Am 10.10.2018 um 08:00 schrieb
            Dennis van J.:<br>
          </div>
          <blockquote type="cite"
            cite="mid:18dc8d48-b5e9-7ce6-844b-d43af06c6af7@yahoo.com">
            <meta http-equiv="Content-Type" content="text/html;
              charset=utf-8">
            <p><font face="Verdana">Hi Sebastian,</font></p>
            <p><font face="Verdana">I took care of the FW problems. An
                iptables --list shows that the udp port is open. <br>
              </font></p>
            <p><font face="Verdana">DD-wrt is running using: Firmware:<a
                  title="About" moz-do-not-send="true"> DD-WRT
                  v3.0-r36645 std (08/19/18).</a></font></p>
          </blockquote>
          <font face="Verdana">okay and finally. which hardware do you
            run it?</font><br>
          <blockquote type="cite"
            cite="mid:18dc8d48-b5e9-7ce6-844b-d43af06c6af7@yahoo.com">
            <p><font face="Verdana"><a title="About"
                  moz-do-not-send="true">Cheers,</a></font></p>
            <p><font face="Verdana"><a title="About"
                  moz-do-not-send="true">Dennis<br>
                </a></font></p>
            <br>
            <div class="moz-cite-prefix">Op 9-10-2018 om 18:29 schreef
              Sebastian Gottschall:<br>
            </div>
            <blockquote type="cite"
              cite="mid:796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de">
              <meta http-equiv="Content-Type" content="text/html;
                charset=utf-8">
              <p>just to make sure. since i'm updating wireguard in
                dd-wrt very often to the latest state of art code from
                git. which dd-wrt version did you use for establishing
                the connection?</p>
              <p>did you also take care about usual firewall problems?
                by default the the firewall is closed on wan, so no
                inbound connection is possible</p>
              <p><br>
              </p>
              <p>Sebastian<br>
              </p>
              <div class="moz-cite-prefix">Am 09.10.2018 um 17:06
                schrieb Dennis van J.:<br>
              </div>
              <blockquote type="cite"
                cite="mid:163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com">
                <meta http-equiv="content-type" content="text/html;
                  charset=utf-8">
                <p><font face="Verdana">Hi all,</font></p>
                <p><font face="Verdana">I have setup Wireguard on a
                    Gentoo box, compiled it into the kernel using
                    instructions on the wireguard website. Got my mobile
                    to connect using 4G to this box fine, so I wanted to
                    test further with a friend of mine who has a DD-wrt
                    installation on his router. Wireguard is integrated
                    into the DD-wrt build, we set it up, but the tunnel
                    does not come up. On the server I only see this:</font></p>
                <p><font face="Verdana">Oct  9 16:45:34 omega kernel:
                    [178809.449718] wireguard: wg0: Receiving handshake
                    initiation from peer 10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:34 omega kernel: [178809.449721]
                    wireguard: wg0: Sending handshake response to peer
                    10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:34 omega kernel: [178809.450130]
                    wireguard: wg0: Keypair 32179 destroyed for peer 10<br>
                    Oct  9 16:45:34 omega kernel: [178809.450131]
                    wireguard: wg0: Keypair 32180 created for peer 10<br>
                    Oct  9 16:45:39 omega kernel: [178814.519668]
                    wireguard: wg0: Receiving handshake initiation from
                    peer 10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:39 omega kernel: [178814.519671]
                    wireguard: wg0: Sending handshake response to peer
                    10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:39 omega kernel: [178814.520062]
                    wireguard: wg0: Keypair 32180 destroyed for peer 10<br>
                    Oct  9 16:45:39 omega kernel: [178814.520063]
                    wireguard: wg0: Keypair 32181 created for peer 10<br>
                    Oct  9 16:45:44 omega kernel: [178819.579701]
                    wireguard: wg0: Receiving handshake initiation from
                    peer 10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:44 omega kernel: [178819.579704]
                    wireguard: wg0: Sending handshake response to peer
                    10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:44 omega kernel: [178819.580094]
                    wireguard: wg0: Keypair 32181 destroyed for peer 10<br>
                    Oct  9 16:45:44 omega kernel: [178819.580095]
                    wireguard: wg0: Keypair 32182 created for peer 10<br>
                    Oct  9 16:45:50 omega kernel: [178824.910142]
                    wireguard: wg0: Receiving handshake initiation from
                    peer 10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:50 omega kernel: [178824.910145]
                    wireguard: wg0: Sending handshake response to peer
                    10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:50 omega kernel: [178824.910535]
                    wireguard: wg0: Keypair 32182 destroyed for peer 10<br>
                    Oct  9 16:45:50 omega kernel: [178824.910536]
                    wireguard: wg0: Keypair 32183 created for peer 10<br>
                    Oct  9 16:45:55 omega kernel: [178829.950001]
                    wireguard: wg0: Receiving handshake initiation from
                    peer 10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:55 omega kernel: [178829.950003]
                    wireguard: wg0: Sending handshake response to peer
                    10 (x.169.86.x:22300)<br>
                    Oct  9 16:45:55 omega kernel: [178829.950406]
                    wireguard: wg0: Keypair 32183 destroyed for peer 10<br>
                    Oct  9 16:45:55 omega kernel: [178829.950407]
                    wireguard: wg0: Keypair 32184 created for peer 10<br>
                  </font></p>
                <p><font face="Verdana">Port on the server is open
                    (since the 4G test works). We can reach the 22300
                    port on his side. Checked the pub/private keys as
                    well.</font></p>
                <p><font face="Verdana">wg show on server:</font></p>
                <p><font face="Verdana">interface: wg0<br>
                      public key: &lt;pubkey server&gt;<br>
                      private key: (hidden)<br>
                      listening port: 51820<br>
                    <br>
                    peer: &lt;pubkey of mobile&gt;<br>
                      endpoint: x.200.39.x:8971<br>
                      allowed ips: 0.0.0.0/0<br>
                      latest handshake: 8 hours, 1 minute, 43 seconds
                    ago<br>
                      transfer: 384.24 KiB received, 2.74 MiB sent<br>
                    <br>
                    peer: &lt;pubkey of dd-wrt&gt;<br>
                      endpoint: x.169.86.x:22300<br>
                      allowed ips: 192.168.1.0/24, 10.100.0.3/32<br>
                      transfer: 2.00 MiB received, 1.24 MiB sent</font></p>
                <p><font face="Verdana">On DD-wrt router:</font></p>
                <p><font face="Verdana">interface: oet1<br>
                      public key: &lt;pubkey dd-wrt&gt;<br>
                      private key: (hidden)<br>
                      listening port: 22300<br>
                    <br>
                    peer: &lt;pubkey of server&gt;<br>
                      endpoint: x.197.199.x:51820<br>
                      allowed ips: 0.0.0.0/0<br>
                      transfer: 0 B received, 777.43 KiB sent<br>
                      persistent keepalive: every 25 seconds<br>
                  </font></p>
                <p><font face="Verdana">We are trying to get logging to
                    work on that DD-wrt box, that should contain some
                    more clues but maybe any of you have an idea?</font></p>
                <p><font face="Verdana">Cheers,</font></p>
                <p><font face="Verdana">Dennis<br>
                  </font></p>
                <p><font face="Verdana"><br>
                  </font></p>
                <br>
                <fieldset class="mimeAttachmentHeader"></fieldset>
                <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com" moz-do-not-send="true">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard" moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
              </blockquote>
            </blockquote>
            <br>
            <br>
            <fieldset class="mimeAttachmentHeader"></fieldset>
            <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com" moz-do-not-send="true">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard" moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
          </blockquote>
        </blockquote>
        <br>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com" moz-do-not-send="true">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard" moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------32CC12FF41586610590708F1--

--===============6934586842182968623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6934586842182968623==--
