Return-Path: <SRS0=HI6M=F6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F057EC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Dec 2020 09:04:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6DB221E9
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Dec 2020 09:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C6DB221E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04587e89;
	Sat, 26 Dec 2020 08:54:41 +0000 (UTC)
Received: from netz.smurf.noris.de (dispatch.smurf.noris.de
 [2001:780:107:b::b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9016fadc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.Com>;
 Sat, 26 Dec 2020 08:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
 From:References:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=raSLxgaEwl0l4KH9Ky7s70Z+Dqx6e/4a47CPUqot2ro=; b=SanX5pwX2Q43TXWUEqToYKINMG
 dpl7jR5VVzjHxbgeWRI+u30z2sm26IdLt8RpPjpiu+c3BJGAYrqUA1ksslqnezS5osfn3p2XVM/xD
 zfanwRRiuPR9ZjVDd2fdj9+ziPkrhiBR3bfziABOfBFr08eWDfklJIZ8v2G4s8C/2/kRY5rYW9SCp
 IEwUD6N56UR1AKd33mV+HwekxKNP4fDWs2dsjqUgiY8xZp+HButGAYSdMoL72J/HHazXaTkA1ySRJ
 3F3IhM8wsP+x51CgNHjt+NDDxYNj/Szz+kOfTV3o8bm7eU88ScwpJrUTxmdb+UDwx0uuZrodd6bP0
 CnaANcGun/wWFKLIg3R8/DWKTORviYg6O/qZe5c4iKSoL11pUzcuCfTyr3jGh3n7uCsCLBwSxIiUG
 a6GAR5cKc0AxwGqK4PMjn+q9IYWmnfJpDaIApW81LFULw5suO+Y80HAb0lZW9K2YcnfHt5hQMA4Iz
 CJTBr88vyPbkS+mUYEtIO6b2/blfV780WRyOC6DPIPwghlik5+cj5KujpwKdOqo4uzYSzCg2q3ptD
 9FJCJbeg/gI3t+sTgmP51eJOitL/m5Ce39VhHqqgn8/Dk6ndayaFYWgLA7yp7s/g+OIcU242YKCDE
 HPMhgcl/cn6DCr8Qkt/3aGPJ8WZGcNPV9Ad5DZVY4=;
Received: from asi.s.smurf.noris.de ([2001:780:107:200::a])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <matthias@urlichs.de>)
 id 1kt5To-0008Ym-G1; Sat, 26 Dec 2020 10:03:16 +0100
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
References: <87k0t75h3e.fsf@ungleich.ch>
 <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
 <dfec7de6-8f7d-4e89-4e90-3865aa6b7d04@urlichs.de>
 <875z4p56p7.fsf@ungleich.ch>
From: Matthias Urlichs <matthias@urlichs.de>
Subject: Re: How to verify a wireguard public key?
Message-ID: <e1b1c0f0-9262-6612-6d05-8b0f255752fb@urlichs.de>
Date: Sat, 26 Dec 2020 10:03:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <875z4p56p7.fsf@ungleich.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EmUADzlDInwDaalX0QtNMwyvEPtmJ8qeI"
X-Smurf-Spam-Score: 0.0 (/)
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EmUADzlDInwDaalX0QtNMwyvEPtmJ8qeI
Content-Type: multipart/mixed; boundary="lUmrm9e9oAzgbpSW86CJV9pJrONaBft3j";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
Message-ID: <e1b1c0f0-9262-6612-6d05-8b0f255752fb@urlichs.de>
Subject: Re: How to verify a wireguard public key?
References: <87k0t75h3e.fsf@ungleich.ch>
 <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
 <dfec7de6-8f7d-4e89-4e90-3865aa6b7d04@urlichs.de>
 <875z4p56p7.fsf@ungleich.ch>
In-Reply-To: <875z4p56p7.fsf@ungleich.ch>

--lUmrm9e9oAzgbpSW86CJV9pJrONaBft3j
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

On 26.12.20 09:09, Nico Schottelius wrote:
> That answer is easy: if you add an incorrect key to your wgX.conf, wg
> setconf will complain and not apply it. And if you are providing
> automated VPNs... well, then this is something you do want to prevent.

Umm, sure, but then the question is why an incorrect key would be sent=20
through your automated VPN deployment in the first place. And if it=20
passes the length check but is still corrupted then that's a worse=20
failure mode than "wg setconf" complaining, 'cause at least you'd notice =

the latter immediately.

--=20
-- Matthias Urlichs



--lUmrm9e9oAzgbpSW86CJV9pJrONaBft3j--

--EmUADzlDInwDaalX0QtNMwyvEPtmJ8qeI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEENzGcEL8EYxehRDgJ+GyybHbBwWUFAl/m/FEFAwAAAAAACgkQ+GyybHbBwWW2
og//c5z1tqZXdypx7Q1PPCs4njzz63yESS1Suk6egLfVuwCYLsnY5S2DBCnmTc6nFNeidATNJ7NF
uoXOt2we9ukJsh1vJZHYTz+yXOQBLJxny9pVey06QXMAPsae3kTIA9MIUhjpC3Ti/JhKJlI+H9/6
trPvPWWhulw5dWQ1Pu2k8AJBdEV4vwJ/RZQk4Q/sEEmR7xbSnN6ILMFpNhnuwhYUYE5TxeKB69L4
ByrPs15TgXkWphriT4iYSUZNnS8Xb+sQSdPVt0B3/fCn4OXObB/hMQGs86Q6oseXglZfc0/gTPu3
kj5QvKSo5+EpjqOONSsw2j4m2HOOtQ1WWkFPSkGy3HIsK5t/mk7WsBC/Ba0ug7BwMwemg51LjBWh
eH1VGLHvw3pP4vL7Ee8d4hYn+8qhsVzXFRKOP5j+GsSRdI/C8U4/l74ZZdLdjwQX21z3HF6zEtVn
Xq3E6229qo084g0LH+30/0M7JaJLQ2wxD2+4JFdVXBpVvE0J8U+hkDRVli7rFgh+zQNMJ1rWaAAI
n8cydzktNcBaFp6daMbHIduTTIrdYMW8Gc02Z1uE3m/1GbqP3+phFEYbCUNbsd9z3nqxChhetsNL
M7Lhyo47tIZazA0Wl/AXGz2IfkLuorsf7j6Mhpp36FMaCPS6GzCvvUBBuXQXViS/2ewhoawUt/za
1vA=
=hqq+
-----END PGP SIGNATURE-----

--EmUADzlDInwDaalX0QtNMwyvEPtmJ8qeI--
