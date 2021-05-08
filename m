Return-Path: <SRS0=Lifx=KD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MALFORMED_FREEMAIL,
	MISSING_HEADERS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802CAC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 18:49:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79CEA613ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 18:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79CEA613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78e11a31;
	Sat, 8 May 2021 18:49:13 +0000 (UTC)
Received: from sonic312-26.consmr.mail.ir2.yahoo.com
 (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6046f3c3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 May 2021 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1620499751; bh=0Zjyes7wp7OazIN1dxTXmoN4HmC79gfKq0HXr+ED2NE=;
 h=Subject:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=B/DcnscWxt/rXXCgS6lVf3eiEEXHTpVTiZExD/D7nAg2e8mStoNMewtMSlsOzMY3GJBxdJAbPKk+tS+p1bML1p7K5HdjSDpwhovqE4Ax9lYIbrlTXIM+dZbfUI/XwEuBGKZwSQWnoL+OTgj6STF71S40R51+zBcyjpZI5SGXA/Dii5PrwPjFNUpvHg0LZzk/kWET1+3/o4goEsGvO289A3eaQ18J/Nco8u86hCukH2QtLdO9YM89nK7ZBqJfjt4YzVZ3CPBwj1VhPCbqM+uO6kHKZN7fyMBlJPvr2VuJ1HphlrppZtKYGpDy8KHIOQ0B0O5lOOeaIETwuDFnZTwUCA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1620499751; bh=xOZuXgHMcN8iK4/t8YQxeSsA5BowVB7CTNn3IAKVlY0=;
 h=X-Sonic-MF:Subject:From:Date:From:Subject;
 b=KcrPwqZhlzD9bHCyRw8EShe/JFXoenkTa19ZIHzW3T205cT1UzYxT2BdGtltdkdZ8n/hsNCKQSL15BJrDL719uNasYeRFQk+WBDqtKg7bAbUFBYl5xt9zNie+BdTYnxBiolTburYprmbysrlCaQ44C5G4pFDQ1lXKSOiJ4sJCvl37C9Y52zIN72uNNf6oALekAPBxzq/7BUkWWEbSdEIUjvHYg35oKJgILTaVa1TqF/+DgDGXFI/jYnsLdMvRyO0p3Iqv4Ek4sLDzIfPU/MSjWtW4lGiBkQ2GFVVTMbGNHx2QSIqYBb8Q27choohtDA0NvWYD69oATErChtcN4snkA==
X-YMail-OSG: fL9qxTMVM1mfe.xhYIDAK_T7QP3xzk9Z2HMeq8FbyWHoujEJuMRWePfUa4ePq_y
 I2mBIAGvLAtppPMxBSwh2A030taqf1lxzMVVAkGuh4pzkJNBEWFfv4deKXRpNOdl2yb8apWtY8II
 jUhCy92_0gu5_6jkHYtdYHVxFuSc8QaiAeJpHTgjnV7rPYdNhwZcd6L78XbdqO22TUyFdFPAzBs0
 2k2j02.NCLYSBQzvLj4TwfHHd_.ajDjDDFK7wD0mG7whp_cZSTsASti.Wec4Wv4DdjeRnh9vr0zP
 p3nzrkA1P28_qsKGPS_1Cf.EPbndiBBEwq.wpwMSRZbstpcsIm_l8Fv5sPNnkV_6nsxMDZ_GrODR
 voDRVDHXlqcOUaZq5oykP3hiMzR1i.F4ngW1BbgoJd1mBPBW6KoN9tCNEDHTax3Sl2MhDYl5Bf2P
 .MQz3XXykw.Er2ml9PXpI0Hq9Uzz70JwCAhqhPIyy1F0dckkG5p8I4bKVp.PRXFWImaWpmHrCfb.
 HecgKRZJ.A0reb.K.lO.Nb_aSrJHqSreXVcZM040aptJimBK_N3P9EPpAY9eWOmKosXe3HaUke9.
 Gpg7vvlycSc1YPywNq3n6EOeyGPzGSoNLSF8CdSj3rCL0aWEIYgv7n3cKZGNqNaqSLkJx20udF_B
 vjU1C6QCJ8wddkcXYA_ecTYYxCn.3VgFmRqudigI.ACOnVx6zywcOY11d2YUs.PU9ZT8_KLne3mX
 bp0DveNqFevTdiIoHOjNDCyc6atD5t8QghxnIktDYgZTbf5.qRWy7z5AOLmF.xhcykM7VHrr727S
 05jIj0IpeIBHtU.R2oQsQ3OhhIjDtaFIOUCd35Q0ZfKUb.sN8_v9qA6WMy168RifyVL5Zbqd5f7l
 8a0aJFJ.lszYcuaSdyAOVvAzQKcVSPYG1xsSCPbjY9BV7EqpjtxlILNQTGgn_cy72PfpvGKEGTGf
 Z_LFHUdUcmZ6cnpY.s5VHE7hxuGf08TO3dBA36Z8.GHjhUzsEBy44uyn1eRcuoPfBTM7t56k5Vvg
 KiauR.5ScPZqAtkHuBhm5302pq37BemXjHJ1X8ZCEtCOMi9evaReTK.dMnYYROBsMpvcmVY3i7Bc
 boO9nyaB5XGlteGWinkjCzWpxQHsvqrpNOd61mh_RfUn.XeJUJpMVhSfoM1sQ887gdBuaoyG846M
 K1TPf8O1j6BSqVRa9p83gRDDbGy7jsLS2nOvnOOcEBqA8pGoGAnVjKdTUw5FYQwxqMSpVoQaPDSX
 uIEu_j40iDuf2ixA_9FUBgK0bW3TvuB5MR3ITNtOvZmJel.Xhmfu5BSq6XAjKn9AlF.dSDqkWI5U
 78cabf7JJHjhUJYk6wnYh12IKjaQY9QdI2qpif64bvxbjij4JB2gq7TE.zsdndbwD0Xi1z_0pts3
 p2zj4iHaRVfbIWof44pVbY801C1seJR8iCM9UByTOcr4ueRdtGq3nMRLFqLd_srbRjMFUtQgawv2
 D96cMAn3v4fFFk.a7VF8oNrMJvxBrES6y5DRdbeys.7x4rw8r9z0yLTrUvcknQE7QzPWToAXhd3f
 rTMSPGEweBJY1R47mCUpUFb9Vvrk7Ex1tFPe5OUwaC8jn.xf4R4UhJM1LS7ddgWeoFbVG214_qBM
 eW3ENu82Guu2rj18X_W1O01EJwUxXMun0HxV0xNRQho269ZWnWKEf__OveLDg9KwcwrsyzjvVSda
 Nne5i6GiQMl2xhd5aUHk9wj2pdrVqPNz1UkQxlkAuCC8j5rkUfszN23qV2B20eVDiomyhV51nvcf
 LiO577ycLXoQxvSr1wCl.faHDFYhFVohE1tdowvoR5iwKUa.1HB29rMY6VVYQrpzNdWJhjt3hsHo
 OXyAoLAlYKvnETvOUP.tx_lslIPhDWTwbOqi.PFtz7IjMTx_pjk2biOYGu59sfw2NvxWk0VUzdz9
 kqoRGMFT4gox.Wz.2d3uvco6.6ThnBC3jQfRZiJNh9XTc1gyrtzArw186oiXmk5P7sJoiSs69Ecm
 ka0LNuPnElmnUHQj5Yf2.FMa81jlw6YqVPB5azlErpEcDJAW6b2owqch9LqlP_nEIshIpBhtUD4m
 O8eKQzkC9bMY4dI4Q9ABV3qYHddKXYGvrY1f1pQfICwTKasddVR4pkNTR9r8sFRdId_0BondyMCQ
 nSdo4XDVlB75B7X_BM8K4kaAq3lguxkzXnKwp_sX3A0nxMRKqRBGg_H.HRHoRmt71mu1mHDpBB8k
 tUQgty0_XVjD42kCcJEidMsakjOBtyRDM0bEXRuV_5pnu1EeuyA46uI8u52hBYWNDVe1B3V6l2KP
 NFuolliVugm.VFFBAnb3.oWoaoSgKiEAW6c5lui8I4lLTV99rB1yZc7qCUCz3sLsCT3PR1v24fsR
 TeQWRgv26_Hm1PQ2Y93etpRdvotYTMKEpHSmSehIhmT1b.IMcbSQSc3K3t.VGV6CRqaDxL.PeMvS
 9FYN_J0pUZPwxLD0FVBxs_Iune21zSrfqkH8InL81z2pceEw6GA--
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Sat, 8 May 2021 18:49:11 +0000
Received: by kubenode522.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 14734ff262416df11dc59a11027dcdc4; 
 Sat, 08 May 2021 18:49:09 +0000 (UTC)
Subject: Re: secondary IP on wg0 fails
Cc: wireguard@lists.zx2c4.com
References: <204f6e7b-d594-c2c0-5242-1643055065c3.ref@yahoo.co.uk>
 <204f6e7b-d594-c2c0-5242-1643055065c3@yahoo.co.uk>
 <20210508215039.31f32aae@natsu>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <eb229853-cc10-88bd-06bb-82bbab73cfe1@yahoo.co.uk>
Date: Sat, 8 May 2021 19:49:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210508215039.31f32aae@natsu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.18231
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/16)
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



On 08/05/2021 17:50, Roman Mamedov wrote:
> On Sat, 8 May 2021 17:31:58 +0100
> lejeczek <peljasz@yahoo.co.uk> wrote:
>
>> I'm experiencing a pretty weird wireguard, or perhaps
>> kernel/OS stack bits behavior.
>>
>> I have three nodes which all can ping each other on wg0's
>> IPs but when I add a secondary IP:
>>
>> -> $ ip addr add 10.0.0.226/24 dev wg0
>>
>> it gets weird, namely, say when that sec IP is on
>> A -> B ping returns; C ping waits, no errors, no return
>> B -> both C & A pings return
>> C -> neither A nor B ping returns
>>
>> I'm on CentOS with 4.18.0-301.1.el8.x86_64.
>> All three nodes are virtually identical kvm VMs.
>>
>> any suggestions as to what is not working here or how to
>> troubleshoot are vey appreciated.
>> many thanks, L.
> Did you add the new IP to AllowedIPs of that node on all the other nodes?
>
> Also remember that sets of AllowedIPs should be unique within the network,
> i.e. can't have the same AllowedIPs or ranges listed for multiple nodes at the
> same time. Setting it to the same /24 on all nodes will not work.
>
> If still not clear, better post your complete config (without keys).
>
It's the same single subnet 10.0.0.0/24 and to reiterate - 
wg0's "primary" IPs can all ping each other.
All nodes have, respectively:
eg. node-B
[peer]
...
AllowedIPs = 10.0.0.1/32, 10.0.0.226/32
Endpoint = 10.1.1.223:51851

[peer]
...
AllowedIPs = 10.0.0.3/32, 10.0.0.226/32
Endpoint = 10.1.1.225:51853



