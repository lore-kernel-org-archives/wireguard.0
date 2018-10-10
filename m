Return-Path: <SRS0=xsnz=MW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C76C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Oct 2018 06:01:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0617621479
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Oct 2018 06:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="p6DzzUMS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0617621479
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e5521e9;
	Wed, 10 Oct 2018 05:59:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c2e24a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Oct 2018 05:59:43 +0000 (UTC)
Received: from sonic304-21.consmr.mail.ir2.yahoo.com
 (sonic304-21.consmr.mail.ir2.yahoo.com [77.238.179.146])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcd30a4b
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Oct 2018 05:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1539151242; bh=7UYcQaAKwABs7xc8etULYOH52EjHXaUDpVMq/gv1EXA=;
 h=Subject:References:To:From:Date:In-Reply-To:From:Subject;
 b=p6DzzUMS/QFwV0iXu+Sg+CwX621r/i2Mpx4c3FMFlpoH+RjrNIPb1sw1eY0RaxradjHwtBp48ZFPmxCboAdjzbN784LyQBpmtBeBvikLwh3VDLMDcaJKQOKTF8IQ6y5H5Ap+HtixcEHhfW0SjkUGZjYBbBAArsF4uHGn3UANATb7G11ogBVJEyJed0siNNVdZgCDBrkApNfql2ARMVa3Q8gevsjOc3BiY0cSNgoqviSyMwHcELQ13kvYaIQOeHNwAE7u1sWcF/5XVdxX2lo9fBKTcvw2eirppsEMhz8mJy7BTL8Nl3KCEQAQOuMc+0JE/QV6nupPgDyKghHRlXm+3g==
X-YMail-OSG: YDEiVVoVM1kP0OrRPT9vPgkBq5ShN9IZ76zwHm3CeciG0_CKIbXha.yfLFUBRyS
 3wrbn_FVpdWnDOkp3ZRdf6AcjMJKTquHZ9S58pW_yG0TcztyvICJoEAcPABpQTP9vpZmLOaTJJnL
 R8_Kg.KyhJkj.lfiliM_Nt.JSwd_nMPwU8mYvqjJFvy9.QUZiQT5OlW_Cqw6PmcV6q8.QzyiD98b
 024WKdw66LQKWFA1fIpLvlV4XRnAN1grvmfSWYT.zutoXq_B_0GJ3xlJMpoCTwFWFGd0i0bs1xnk
 FEA8clug6Z.W2gRkHV_dYKNVPZF2nXwm9WqX5BSviV9sjamWzsWNshgzBufn1VZQOM_mrStdc9yK
 7pehESgTWp0.RFyS1j3lKCqtsJqKEMQyuWD8nLets.dW14fbkkRMFKf0bwLBBN1atuM.cX3UO_po
 rDKAkQIGPs.aU4dTZzpRn6OYPRPjfCaRItVOHrfIDehXhzsJD8EG.MEoizCdcORxcYSp_4PZIifW
 BHUoJWKajnAFlaed2Ts4LOmjRpMvqOt176r97CI2VTyzVAp_34udxRBDmEy42VBSan4myPd.YMUg
 GByXfZZ1ntxFlryxpS3xbJN48xGEVR_lMuQNKi_AV.YOqpJxU.alLVmpwVposIgrr_ff7vNxfHbo
 Y4XPW4OQdhJnigorMSQCy86lhn1tbOrrvTRkiatCN9WJwZF2lur3bjIEUil5E4E9AanR9J7yGzE.
 drITeuWphRD1pcV74Dbtf6Qk.eKD2jF4Vv9H68rgxMRMfcUPQB2sCexbAuN1uAAJjgkJUoEriaKx
 anHdaviiTy6A5TQ9.mQfAlFoB3Soy_y_syJaifTew1PvHtQzMluiehjme8UM6FtoDAjBj1q_W95j
 875oi4a33ysujJIDMXwlYmBMcM74wXx93gTTKhsDijHPnjRuN171WUFUFfXSgX1lnvOdzxVNXwSl
 LR3REaiNeZJfDw._F6fCBNsepp_pbT13qwVY4ZnWsAAz_WyGiOlFG34EFGmTqEOQuFzhwAnt.n9D
 FPDL._MHoGvKKdY3KD.SV22__M.RDhZED.ka2BV9cF9BTGn6APMw-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ir2.yahoo.com with HTTP; Wed, 10 Oct 2018 06:00:42 +0000
Received: from 82-197-199-141.dsl.cambrium.nl (EHLO [192.168.20.251])
 ([82.197.199.141])
 by smtp413.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 82b7289526d736620b4640f682390162 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Oct 2018 06:00:37 +0000 (UTC)
Subject: Re: Wireguard not coming up on DD-wrt
References: <163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com>
 <796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: "Dennis van J." <dennis_20@yahoo.com>
Message-ID: <18dc8d48-b5e9-7ce6-844b-d43af06c6af7@yahoo.com>
Date: Wed, 10 Oct 2018 08:00:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de>
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
Content-Type: multipart/mixed; boundary="===============0729723043672361054=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============0729723043672361054==
Content-Type: multipart/alternative;
 boundary="------------9314B98189E0C46ADFDCC476"
Content-Language: nl

This is a multi-part message in MIME format.
--------------9314B98189E0C46ADFDCC476
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Sebastian,

I took care of the FW problems. An iptables --list shows that the udp
port is open.

DD-wrt is running using: Firmware:DD-WRT v3.0-r36645 std (08/19/18).

Cheers,

Dennis


Op 9-10-2018 om 18:29 schreef Sebastian Gottschall:
>
> just to make sure. since i'm updating wireguard in dd-wrt very often
> to the latest state of art code from git. which dd-wrt version did you
> use for establishing the connection?
>
> did you also take care about usual firewall problems? by default the
> the firewall is closed on wan, so no inbound connection is possible
>
>
> Sebastian
>
> Am 09.10.2018 um 17:06 schrieb Dennis van J.:
>>
>> Hi all,
>>
>> I have setup Wireguard on a Gentoo box, compiled it into the kernel
>> using instructions on the wireguard website. Got my mobile to connect
>> using 4G to this box fine, so I wanted to test further with a friend
>> of mine who has a DD-wrt installation on his router. Wireguard is
>> integrated into the DD-wrt build, we set it up, but the tunnel does
>> not come up. On the server I only see this:
>>
>> Oct  9 16:45:34 omega kernel: [178809.449718] wireguard: wg0:
>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:34 omega kernel: [178809.449721] wireguard: wg0: Sending
>> handshake response to peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:34 omega kernel: [178809.450130] wireguard: wg0: Keypair
>> 32179 destroyed for peer 10
>> Oct  9 16:45:34 omega kernel: [178809.450131] wireguard: wg0: Keypair
>> 32180 created for peer 10
>> Oct  9 16:45:39 omega kernel: [178814.519668] wireguard: wg0:
>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:39 omega kernel: [178814.519671] wireguard: wg0: Sending
>> handshake response to peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:39 omega kernel: [178814.520062] wireguard: wg0: Keypair
>> 32180 destroyed for peer 10
>> Oct  9 16:45:39 omega kernel: [178814.520063] wireguard: wg0: Keypair
>> 32181 created for peer 10
>> Oct  9 16:45:44 omega kernel: [178819.579701] wireguard: wg0:
>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:44 omega kernel: [178819.579704] wireguard: wg0: Sending
>> handshake response to peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:44 omega kernel: [178819.580094] wireguard: wg0: Keypair
>> 32181 destroyed for peer 10
>> Oct  9 16:45:44 omega kernel: [178819.580095] wireguard: wg0: Keypair
>> 32182 created for peer 10
>> Oct  9 16:45:50 omega kernel: [178824.910142] wireguard: wg0:
>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:50 omega kernel: [178824.910145] wireguard: wg0: Sending
>> handshake response to peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:50 omega kernel: [178824.910535] wireguard: wg0: Keypair
>> 32182 destroyed for peer 10
>> Oct  9 16:45:50 omega kernel: [178824.910536] wireguard: wg0: Keypair
>> 32183 created for peer 10
>> Oct  9 16:45:55 omega kernel: [178829.950001] wireguard: wg0:
>> Receiving handshake initiation from peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:55 omega kernel: [178829.950003] wireguard: wg0: Sending
>> handshake response to peer 10 (x.169.86.x:22300)
>> Oct  9 16:45:55 omega kernel: [178829.950406] wireguard: wg0: Keypair
>> 32183 destroyed for peer 10
>> Oct  9 16:45:55 omega kernel: [178829.950407] wireguard: wg0: Keypair
>> 32184 created for peer 10
>>
>> Port on the server is open (since the 4G test works). We can reach
>> the 22300 port on his side. Checked the pub/private keys as well.
>>
>> wg show on server:
>>
>> interface: wg0
>>   public key: <pubkey server>
>>   private key: (hidden)
>>   listening port: 51820
>>
>> peer: <pubkey of mobile>
>>   endpoint: x.200.39.x:8971
>>   allowed ips: 0.0.0.0/0
>>   latest handshake: 8 hours, 1 minute, 43 seconds ago
>>   transfer: 384.24 KiB received, 2.74 MiB sent
>>
>> peer: <pubkey of dd-wrt>
>>   endpoint: x.169.86.x:22300
>>   allowed ips: 192.168.1.0/24, 10.100.0.3/32
>>   transfer: 2.00 MiB received, 1.24 MiB sent
>>
>> On DD-wrt router:
>>
>> interface: oet1
>>   public key: <pubkey dd-wrt>
>>   private key: (hidden)
>>   listening port: 22300
>>
>> peer: <pubkey of server>
>>   endpoint: x.197.199.x:51820
>>   allowed ips: 0.0.0.0/0
>>   transfer: 0 B received, 777.43 KiB sent
>>   persistent keepalive: every 25 seconds
>>
>> We are trying to get logging to work on that DD-wrt box, that should
>> contain some more clues but maybe any of you have an idea?
>>
>> Cheers,
>>
>> Dennis
>>
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard


--------------9314B98189E0C46ADFDCC476
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Verdana">Hi Sebastian,</font></p>
    <p><font face="Verdana">I took care of the FW problems. An iptables
        --list shows that the udp port is open. <br>
      </font></p>
    <p><font face="Verdana">DD-wrt is running using: Firmware:<a
          title="About"> DD-WRT v3.0-r36645 std (08/19/18).</a></font></p>
    <p><font face="Verdana"><a title="About">Cheers,</a></font></p>
    <p><font face="Verdana"><a title="About">Dennis<br>
        </a></font></p>
    <br>
    <div class="moz-cite-prefix">Op 9-10-2018 om 18:29 schreef Sebastian
      Gottschall:<br>
    </div>
    <blockquote type="cite"
      cite="mid:796625c4-d114-1b5f-ea79-97b91e682549@newmedia-net.de">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p>just to make sure. since i'm updating wireguard in dd-wrt very
        often to the latest state of art code from git. which dd-wrt
        version did you use for establishing the connection?</p>
      <p>did you also take care about usual firewall problems? by
        default the the firewall is closed on wan, so no inbound
        connection is possible</p>
      <p><br>
      </p>
      <p>Sebastian<br>
      </p>
      <div class="moz-cite-prefix">Am 09.10.2018 um 17:06 schrieb Dennis
        van J.:<br>
      </div>
      <blockquote type="cite"
        cite="mid:163f39a3-0fb5-3645-b6bd-3ddd797c158b@yahoo.com">
        <meta http-equiv="content-type" content="text/html;
          charset=utf-8">
        <p><font face="Verdana">Hi all,</font></p>
        <p><font face="Verdana">I have setup Wireguard on a Gentoo box,
            compiled it into the kernel using instructions on the
            wireguard website. Got my mobile to connect using 4G to this
            box fine, so I wanted to test further with a friend of mine
            who has a DD-wrt installation on his router. Wireguard is
            integrated into the DD-wrt build, we set it up, but the
            tunnel does not come up. On the server I only see this:</font></p>
        <p><font face="Verdana">Oct  9 16:45:34 omega kernel:
            [178809.449718] wireguard: wg0: Receiving handshake
            initiation from peer 10 (x.169.86.x:22300)<br>
            Oct  9 16:45:34 omega kernel: [178809.449721] wireguard:
            wg0: Sending handshake response to peer 10
            (x.169.86.x:22300)<br>
            Oct  9 16:45:34 omega kernel: [178809.450130] wireguard:
            wg0: Keypair 32179 destroyed for peer 10<br>
            Oct  9 16:45:34 omega kernel: [178809.450131] wireguard:
            wg0: Keypair 32180 created for peer 10<br>
            Oct  9 16:45:39 omega kernel: [178814.519668] wireguard:
            wg0: Receiving handshake initiation from peer 10
            (x.169.86.x:22300)<br>
            Oct  9 16:45:39 omega kernel: [178814.519671] wireguard:
            wg0: Sending handshake response to peer 10
            (x.169.86.x:22300)<br>
            Oct  9 16:45:39 omega kernel: [178814.520062] wireguard:
            wg0: Keypair 32180 destroyed for peer 10<br>
            Oct  9 16:45:39 omega kernel: [178814.520063] wireguard:
            wg0: Keypair 32181 created for peer 10<br>
            Oct  9 16:45:44 omega kernel: [178819.579701] wireguard:
            wg0: Receiving handshake initiation from peer 10
            (x.169.86.x:22300)<br>
            Oct  9 16:45:44 omega kernel: [178819.579704] wireguard:
            wg0: Sending handshake response to peer 10
            (x.169.86.x:22300)<br>
            Oct  9 16:45:44 omega kernel: [178819.580094] wireguard:
            wg0: Keypair 32181 destroyed for peer 10<br>
            Oct  9 16:45:44 omega kernel: [178819.580095] wireguard:
            wg0: Keypair 32182 created for peer 10<br>
            Oct  9 16:45:50 omega kernel: [178824.910142] wireguard:
            wg0: Receiving handshake initiation from peer 10
            (x.169.86.x:22300)<br>
            Oct  9 16:45:50 omega kernel: [178824.910145] wireguard:
            wg0: Sending handshake response to peer 10
            (x.169.86.x:22300)<br>
            Oct  9 16:45:50 omega kernel: [178824.910535] wireguard:
            wg0: Keypair 32182 destroyed for peer 10<br>
            Oct  9 16:45:50 omega kernel: [178824.910536] wireguard:
            wg0: Keypair 32183 created for peer 10<br>
            Oct  9 16:45:55 omega kernel: [178829.950001] wireguard:
            wg0: Receiving handshake initiation from peer 10
            (x.169.86.x:22300)<br>
            Oct  9 16:45:55 omega kernel: [178829.950003] wireguard:
            wg0: Sending handshake response to peer 10
            (x.169.86.x:22300)<br>
            Oct  9 16:45:55 omega kernel: [178829.950406] wireguard:
            wg0: Keypair 32183 destroyed for peer 10<br>
            Oct  9 16:45:55 omega kernel: [178829.950407] wireguard:
            wg0: Keypair 32184 created for peer 10<br>
          </font></p>
        <p><font face="Verdana">Port on the server is open (since the 4G
            test works). We can reach the 22300 port on his side.
            Checked the pub/private keys as well.</font></p>
        <p><font face="Verdana">wg show on server:</font></p>
        <p><font face="Verdana">interface: wg0<br>
              public key: &lt;pubkey server&gt;<br>
              private key: (hidden)<br>
              listening port: 51820<br>
            <br>
            peer: &lt;pubkey of mobile&gt;<br>
              endpoint: x.200.39.x:8971<br>
              allowed ips: 0.0.0.0/0<br>
              latest handshake: 8 hours, 1 minute, 43 seconds ago<br>
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
        <p><font face="Verdana">We are trying to get logging to work on
            that DD-wrt box, that should contain some more clues but
            maybe any of you have an idea?</font></p>
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
  </body>
</html>

--------------9314B98189E0C46ADFDCC476--

--===============0729723043672361054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0729723043672361054==--
