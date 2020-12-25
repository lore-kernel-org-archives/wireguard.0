Return-Path: <SRS0=IEsR=F5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05868C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 14:43:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6742122255
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 14:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6742122255
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a0a46d4;
	Fri, 25 Dec 2020 14:33:29 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ddb2322
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Dec 2020 09:00:29 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 6904C211DF;
 Fri, 25 Dec 2020 10:09:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1608887399; bh=YOg+OMSFcEB4GZXzxD+bVNqiV1j1yPTLqC+7f4E3Y/I=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=JnwDF8DchDGr9SyWAaxIJXRza2YdvGFtFKYiqwJrn14aap/Pt/724bhsinBuBoKRz
 Z9TfgUgJQ39Gheh2Jhaf4zA1O3uktPH/tCdqq0W6y1KKpWn3o5Sa2oyLB73ZcTds8T
 R1eyGw3e8t0OniHPWYzUkgW3NqFDqqRBsx1lI2cgkfFkSNINLioLXEPXFarWCVqiDb
 HupveVLcPfuvmipT8vaJWrXlRcqLSBC+eTdEKJ3kZi8XE0DYeQVtHSqh5qtPWH+6Av
 bL+U6+0r+UGmOv6JySmHeVuuS2RyNqHr4sukzFxkK4HtVQE9VVD7waNtRu1QoErHA1
 0OzQMKxqAZD9Q==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id 4B1301A6EA51; Fri, 25 Dec 2020 10:10:08 +0100 (CET)
References: <87k0t75h3e.fsf@ungleich.ch>
 <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Adam Stiles <ajstiles@gmail.com>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, wireguard@lists.zx2c4.com
Subject: Re: How to verify a wireguard public key?
In-reply-to: <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
Date: Fri, 25 Dec 2020 10:10:08 +0100
Message-ID: <87h7oa5k0f.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 25 Dec 2020 15:33:24 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Good morning Adam and Jason,

thanks for your qualified and fast answers! It's nice to see Dan's
website still referenced in almost 2021 and also that it can be easily
enough verified.

For reference and if anyone ever looks up this thread, I am using
the following code within the Django Rest Framework [0]:

--------------------------------------------------------------------------------
    def validate_wireguard_public_key(self, value):
        msg = _("Supplied key is not a valid wireguard public key")

        """
        Verify wireguard key.
        See https://lists.zx2c4.com/pipermail/wireguard/2020-December/006221.html
        """

        try:
            decoded_key = base64.standard_b64decode(value)
        except Exception as e:
            raise serializers.ValidationError(msg)

        if not len(decoded_key) == 32:
            raise serializers.ValidationError(msg)

        return value
--------------------------------------------------------------------------------

Thanks again and enjoy the quite time over Christmas!

Best regards,

Nico

[0] https://code.ungleich.ch/uncloud/uncloud/-/blob/master/uncloud_net/serializers.py#L37


Adam Stiles <ajstiles@gmail.com> writes:

> Hi Nico,
>
> WireGuard uses Curve25519 keys. A Curve25519 secret key is a random 32
> byte value with a few special bits flipped, and a public key is
> calculated from a secret key.
>
> There's some good info here (https://cr.yp.to/ecdh.html), including
> this questions and answer:
>
> "How do I validate Curve25519 public keys?"
>
> "Don't. The Curve25519 function was carefully designed to allow all
> 32-byte strings as Diffie-Hellman public keys."
>
> I just saw Jason's response, and so this is a bit redundant, but the
> reference above is a good one.
>
> Best,
>
> Adam
>
>
> On Thu, Dec 24, 2020 at 3:21 PM Nico Schottelius
> <nico.schottelius@ungleich.ch> wrote:
>>
>>
>> Good morning,
>>
>> I am currently extending uncloud [0] to support wireguard tunnels and
>> keys. At the moment it is not entirely clear how to verify that a
>> certain string is a valid wireguard key.
>>
>> I first tried checking that it is valid base64, but not all base64
>> strings are valid wireguard keys.
>>
>> Then I tried using `echo $key | wg pubkey && echo ok` - which seems to
>> check the key format, however the intended behaviour here is misused.
>>
>> Does anyone have a pointer on how to reliably identify wireguard public
>> keys?
>>
>> Is the wireguard key always 32 bytes when decoded from base64? Tests
>> with a number of public keys seems to indicate that.
>>
>> Best regards,
>>
>> Nico
>>
>>
>> [0] https://code.ungleich.ch/uncloud/uncloud
>>
>> --
>> Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch


--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
