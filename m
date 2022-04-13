Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1FDC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Apr 2022 17:45:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8b75a1c3;
	Wed, 13 Apr 2022 17:45:30 +0000 (UTC)
Received: from sonic310-11.consmr.mail.ir2.yahoo.com
 (sonic310-11.consmr.mail.ir2.yahoo.com [77.238.177.32])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8a1e132b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Apr 2022 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1649871927; bh=FdlflU5GMud5I7d2iMsaw3Hv48BCI+tgxQb8v3CSWKM=;
 h=Date:To:From:Subject:References:From:Subject:Reply-To;
 b=PGjomFhFRfORDT3dCDjIDc3zPeJmUDOLVOjjzMQUyzQ8ubJxyNz69lBShw1JgpIMt6QpHpQcOx9b+wMmnDBOsjHkxEGEuThnZ8DCLo3cW322GWKVZh0qUMr02myfdS2Th2WLF5pSnqSu651sH5kpZrvIl6otYv2izd97h25+VClSF5fv5Np/rc/MWPuwL/s4BVxUY2vQ/KXeHGfMIbJdKfBkkx8P8DKSDgKGEZgj/9XTs+OPNEjdwEDLrQORtXE61FtNNJOYExlEDFpAqEAl959Bpb6jp2MMwNk4/zyUmJMWRwz5pVcEGAzWPAIEEde4H7NYJRMjF2QvZsA7ps9B3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1649871927; bh=/CvUWFeNPKWS0aathI8Zs75KfLitoQh24n/G8PjEggJ=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=XywTBgjIJhpx2NjlpKcEiCddopj8q1hs1mi6I9xKNZF4/G7P6oGaqxEKnrPTnibI03uz0FdB6yLxuxLk6Xn6uLjolAMhnvPhV1xe8Z5h2JTqckdhdzu/7COFcz8x0aGkQM5KnhDl/FXZa6W5FxPSG+sJCHSDYdaLs2j3s28vgdQ2pBS+ESWMxNjfLWVe+/PEA6WDoglNN2XIrip+OCZVzq6ayoAS1PXzHW72V6tWPIfF5nTidtlrc1VYIWtTtvz+L2uFHXjK7KpzQ6YrCRwxT0FtggJws7cZ/NRhFE+S+P1ZFS7BRKw+Lhv1XfPmPwC3xYS7nxhiUAbIZCga7JmT1g==
X-YMail-OSG: EwYhkncVM1lwz0EjOdjwBhtMcnfUy84pcwDN3CHIdbA4QCRAs6yfRgfk8K9IQ2L
 0fDawMgKE9pe_slucNTa4PDw2s1IyshJZLboDXj6hxUvVSmr.IaTXKgAsFO5SJEp.HVLiHThAYpT
 nenye.3jQcVXZdVdeIobYKH78.cE3dtbjutI9lwlcvtx_jtQxD53UPThA.5fUGh07X6SLsmnc7Wr
 QyN7DGMQqeDZp96jD2UnhgEyZ6VCDaj7kXu8MbJJIjNYnZ6szOTSDrQTwSlOEO.lgB.QBg9tG4K6
 .QEYkBVNDoChQPFfFhcgHQiLNrvQOo_5T6N8OKHunAga5rwUkl5NQ40VhanM4oKHVzKiS50L2nNv
 k17YViTpk.uHytxgbqk16EGmPfmP7PbXPCpkX9GyRV5ZLw0aEHWlTf1yXPyAXqTCsX_imIv35QMC
 MATUk5wNK4.ANy2z.9c4tnmrn8078c.OU8n7U_lhkauFfPiS98MRzYnhNPIVAxrLw7i_JuJrDHQx
 _x6dA0nYD4ljn62UXBDhqXaTmnxGSIMCJpyCLuqP2742WBngfo.XSiReV6MZGgzXK0DL6Ap1P1rR
 8.C6j1CaRBMf6WfEIs8bf1gg2b8Z57OhGCQb6pYLR4U0AtSVgJz90BPo76twtjZN2JI0UgCX1wFz
 xFpa9IohM5fNitB59vNzByQaYi43IW4slklr3it07XzuZsk5lR3oX1Qguia.V5uA46kcpHBNOMXr
 Pbm8l0g4H1X08Msf4wQyKtPDc79vMiVhFMDB40Yt.5umZQQPIWAoRUH9.FI2jBcw2sSsBVVOCUlw
 QkGjtZ6hcuKwN8mAMUizTHYMUJTnuh0fnDY0z8ISTlGJ08F5b2WA56o7M0ObhR0vKNVIyL5Oby27
 OgoMQ1hlqKILnjBwIQoepH2HlO0RFWVl0ti99u0m_UPIReVKpSdMHi7x9D64o2UfGqT1b0rizV8j
 V3XhhZ4Ued2ZFfYHyuTyrtX.SpSquy5JBe.mgE.4fvSBNq7ZjqGhYbilu3xvpq.q2JtfpuLAgDnD
 CEYbacVOMKtgLzoVpommwW9jofXLVUGrD5l1hBmeMPzefXAUt0m7pEZzhSARBc0zxFASEH24gRea
 ISbZ9qD9C093yCORu9XtkXIgzaLgjq0hnIKlEsQ_4IELbbEdp5FWrCqUbmxiuhdDEkoKBOpOQFc4
 AhltSjzQcupyTOh5jP94cDxHnjVR8_pXhvN0e7oa5t1tLicTeoCbKpps8u.jYg985jqh.roymP6U
 wNNe..oAkci5wnBjtr7Kv0Y3XHuZ6Ub2eWL.YekPuRH0fCDSsFOzNo7.oXVnImKj9wSiBw8Aegbk
 2aBJSn.7TcfnArYCoRoAZUcJ6DTB4cgt8DuuCkyHfU3qY70RYg._PXDSxidZEQBRLefyvL1j.lud
 YRobdbP0Pb7mdIaLC5OVZEZ6IdKnuGOmSWa.MuEs1CzDJbmsquKj8mE3bz7EyDWb5tPhNhk_vPA.
 fldrrsVoWoXqH2rxRxgalP819r2MTaPwnnUZ0I42GlVIw2xpu9WLfpG2etMyWzpu9sbEku8X_T_c
 Uihc6r5EazWOCS172jYqk9K19NrD9AlUfX95CJTfSFYTC6cClr2GLTjhbe6D1AS_PIdj5Qls2Az1
 P0tOgWCOxVsIKlJyILicMKmV_AAtZEQ8qs6HqBtilif428gMe26a56fF1tZ_h455UBvB3YFRAvLy
 4aknUJH_ZWUUNeJ22DQ6wuZNTkpFTtgEH2IlproJv7mjg5GjGGq0vnTePK72Mm0fds16x6uS9QsE
 1TGBWZsUwSM_Lo6rzFVaKrbSSZEje49QpY.tXZqoiTuSfIvOOoi_8aGSCywbZO0tq0vnLeIDLkc4
 OP_iMyCuQ_9tcBN9GnYm_qIGLe2aC5_RNGTlMqD3C8GcG7KlKymv82EqJU4f2H5TICpDaE2WFmIJ
 5L2wdPgClHO7MgE7hJB4wGn_ISJuVQo2U_ym5Eo21UbxK0ziuakp9AyUo3hN3y7PX3G6ebfeiySf
 pX5SqLOLTmHhAqMoDb9svKv0y2KW7gm6ECOLzz3lAfFgZK1I0eUDQnDBwB1Ge9cRBbkoDaH2R0yU
 UEMhdJxgLgCnbJ5Ct2C4N1JOnNutKv6VpmZTnIam9QTBvK1zRIICkIRz35_9Hx6Oo4q09q8emLZS
 wLf92wr4IgYEyYeNdXb3CezfJ4mnXoKMHsnIPceH9Xq70Z6WbooOyzwg9ps2oN7kSNTVIkyjPNCY
 mQtbFpGcrls9xfSvPQMjosWn.hhc2Zl89pRCYkYoL_xVqGkrK08Kbnu61
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ir2.yahoo.com with HTTP; Wed, 13 Apr 2022 17:45:27 +0000
Received: by hermes--canary-production-ir2-7d675798cc-pbgq7 (VZM Hermes SMTP
 Server) with ESMTPA ID d445b9e4147265d403ca48975fe41358; 
 Wed, 13 Apr 2022 17:45:25 +0000 (UTC)
Message-ID: <077cdb1c-e06c-d2fd-1475-269ed744d5ca@yahoo.co.uk>
Date: Wed, 13 Apr 2022 18:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: lejeczek <peljasz@yahoo.co.uk>
Subject: error - ? - Address already in use
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <077cdb1c-e06c-d2fd-1475-269ed744d5ca.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.20001
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

Hi guys

what is below error the symptom of?

-> $ wg-quick up wg-r2
[#] ip link add wg-r2 type wireguard
[#] wg setconf wg-r2 /dev/fd/63
[#] ip -4 address add 10.3.3.254/24 dev wg-r2
[#] ip link set mtu 1320 up dev wg-r2
RTNETLINK answers: Address already in use
[#] ip link delete dev wg-r2

I'll only add that I looked into "obvious" places and found 
nothing.
many thanks, L.
