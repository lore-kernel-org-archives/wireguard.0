Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFA6C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 17:54:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8040420866
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 17:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solidadmin.com header.i=@solidadmin.com header.b="aoGa6G3K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8040420866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5238f4e;
	Fri, 3 Jan 2020 17:53:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd437945
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 17:53:44 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a200db7a
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sbDzDcqT3Pk4mQpz4Vf2XKjtvCTKR23VuxgVdPgJ7uc=; b=aoGa6G3Kezml1IPLrEMYwa4iL
 SjprupkMjeu+mt7ZmA2NhjPzS4ZKtF4GrE2Q2SKJ+4XaZV7DEgZUnosuCVUgipGdJximV5ITBosN9
 VjXuznyly4/FAA5FtLsZ9iILB9IOuNNbqee2VJAVF8AY7jQSFyyYC1phtkndDZ/6GjBXCsm/bJnCt
 psjcP5ZDJghzKKWfp+AzD0ZBji9C2K0a119My1rbGdqCE0OUjeyL5nLynV56587OWwuAUUaSi/1hk
 J7kEQeaCFB9aEEHt7SsZDjoSEyHd9hjitzO7povYG7ZdcJRu/h3k90pQoL+FXhHKj8/x6M1TegUQ6
 P116t2lcQ==;
Received: from c-67-173-122-188.hsd1.il.comcast.net ([67.173.122.188]:40512
 helo=[192.168.1.179]) by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <joe@solidadmin.com>) id 1inR8q-0001Ud-OW
 for wireguard@lists.zx2c4.com; Fri, 03 Jan 2020 11:53:44 -0600
Subject: Re: wireguard broke with recent update on fedora 31
To: wireguard@lists.zx2c4.com
References: <6c155e17-eb7a-c267-ee10-6cbb8a56857f@zx2c4.com>
 <6A278F71-FC48-497B-9948-D65A85004F57@barrys-emacs.org>
 <59d645ac-4c88-4d68-b96d-7e4acaeeb618@solidadmin.com>
From: Joe Doss <joe@solidadmin.com>
X-Pep-Version: 2.0
Organization: SolidAdmin
Message-ID: <a4e5e78d-afa0-c7d5-30dc-56fa139c3a85@solidadmin.com>
Date: Fri, 3 Jan 2020 11:53:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <59d645ac-4c88-4d68-b96d-7e4acaeeb618@solidadmin.com>
Content-Type: multipart/mixed; boundary="------------2E038DA87021CD873B318EFC"
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - conquer.yellowcord.com
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - solidadmin.com
X-Get-Message-Sender-Via: conquer.yellowcord.com: authenticated_id:
 jdoss@solidadmin.com
X-Authenticated-Sender: conquer.yellowcord.com: jdoss@solidadmin.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--------------2E038DA87021CD873B318EFC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Barry,

Some older versions are building now:

https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/builds/

I have not tested them as I had to make some changes so the old repo
sources to build the src RPMs. Let me know if you run into any issues.

Joe



--=20
Joe Doss
joe@solidadmin.com

--------------2E038DA87021CD873B318EFC
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBF374IIBCADjT8/webjOutqb2L9F0cEJlDi8RPXLTd1wVkbsnneU8fNSsP+A
Oz3ugILXEqEyZPjpjxSBA2M22Jd+jRFJoRczz2MYq6ezmKspRJQZMURIKRuK9IGZ
Wf37D/4Rk1oLRlDLtJDlSE60tvA2Bs/2Q0wiEfvzvZmkAzjoN4LvkPi5kfEXOuRB
LjIBibVj5BImLJ27N0HiPTzyv4tJtnzb5w93lShTWJ4ngb516xTnDOiGAawsJcn1
UZl6pCcz4ia/fSTPJkQTUocTqtXU957cpAyIwQN1E2/Foy8zB4ezC/3Jem6RZk5n
OaEO7lvwC9RHTzagpTrPNdCScEi9ayV39zNFABEBAAG0HUpvZSBEb3NzIDxqb2VA
c29saWRhZG1pbi5jb20+iQFSBBMBCgA8FiEEcIPFJSTTuGg1YXcFZWJIZa9v/qYF
Al374IICGwMFCQHhM4AECwkIBwQVCgkIBRYCAwEAAh4BAheAAAoJEGViSGWvb/6m
50oH/0WxR8juX5M4lzIYRrQq0vp1NaOhOVeaTPeFfZE7PnpRREDm9GYiCKoO+6dv
wTROz9WtcXS1xl3mVMvROgsQ/ZKTHNRQ1vIxyG3R5yc7LFyNL1A8ZnV8Nu/g2Gpy
GMpka7oIvN72vwpVXMofnthEBW6bg+j8AEZBr/mWtruxjvdr48hnFHathDgjWFok
sgK//K0MG/yUihS37yzhPHIotmm0tg7+ReNeI/jM/unGQi6n+vJEMGzvFw1DIbgQ
Q1ywRTieCxom5Q64QyUtucyIjPJrw1Eurxq6gdHJ35zEUkJQaoJn/VQdBSUVLGdj
BUefxwrnFhOy63DFSGbapnmiaKu5AQ0EXfvgggEIAOMiGTLAyNKCkVluWJAMRsMm
q9IufhkcmjGcINd3OA0/im/o/6VbJX6D1rNjHkpfUwIPMJe2+wtEGnViGhHpGPg/
C9MY4fk3JlfOZ+stCl3+dqwm0rPwJSdmaSR/+32wboW09DJ1cyJK0QrraXDDoUJF
VTIHRpkqN+74iYpXINCupQr01KCwpc2AQio4DI9F0nlZOUGRa8T9UtdudmdmBQaF
NxOOkYZX2zaYgKe18pRkZ1s5nDXKSt8F1wcqm1jQVJWYTR1+AfFcpC2a+WKfmITv
Rd76nJ8+a8G/VYmFIJwrvWxKSuC+PO/8jsBe6+JchQZOF8QmKu2X0xpF146yGuUA
EQEAAYkBPAQYAQoAJhYhBHCDxSUk07hoNWF3BWViSGWvb/6mBQJd++CCAhsMBQkB
4TOAAAoJEGViSGWvb/6mBlIH/0HchnbtKayrjC532Tlpc4beDTrpgT1SbM8QyWNe
qtOzlODhPG46DtS+RY9w61rylSJxM9SgC2XwRjjx2ZBiSj1falI0EcfllFPa8v6u
msfBNAbzokzsJb8/i5hCuEfv3Npa9J1ZLo8ZwEk9SobLaa5WUa8nqZlgHtemZIFo
krpAc20QZKgE4VP0J397kuTPr1Zgl+t8llO+1I7Z08ajZMmm/yjpOBfbEJS4olba
GICub0tiK2JZ6zNtwxQmPryUl67UTj896DDEgN3ndrc9bCQizliTUW4RMaBd8FYz
KNWAxKFBPqOvOG4etxOAZeFMZmNUjZjpilKnWn4qnCpxYVw=3D
=3D4Z8k
-----END PGP PUBLIC KEY BLOCK-----

--------------2E038DA87021CD873B318EFC
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------2E038DA87021CD873B318EFC--
