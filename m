Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFB8C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 12:14:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e7620c11;
	Wed, 29 Jun 2022 12:14:00 +0000 (UTC)
Received: from sonic312-25.consmr.mail.ir2.yahoo.com
 (sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id df995c13
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1656504837; bh=GP7yzIUiuO2QCuf0uvPibzeox2tg41XI9NnF/lEzW+s=;
 h=Date:To:From:Subject:References:From:Subject:Reply-To;
 b=e79vfobPbNLQIrPFQrB7m08+b091c3Oxz72J2i12QkOVu3YjF6DkKGiA8u+k8dBcIQ8AblhIr3ZKbNiBRJdmob7alao9RGKtLva7GjEPvz7IsGPcg/s6t6uCoLHho8gScUJH52XXC4fDD8fca/Z/0Zk7qzt2FrKvhn9rA4OHa9QrjauB1UuYGOXcLEEA+0KS9UlGGGYEMvI5+yyfNXxGuek3KsZKuzAbV5mTJKKzfhfh9eZoD2RSSjw3Oo8rsjjgow+1wDOsqnE3JHc+Izh1bTE9ccEpPUTUqv/MRYo/QKrvcXhHzuh/QnKVGQQMicIlub7QAFaglaGkpV2KUmaa1g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1656504837; bh=AFXl3TJqMGAc7SbHyP26/ZJcMkPEL6piFuFmWZt1T3I=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=Aj1LmprsVStqqECr45dj5v2nWHFezF6zhjyr28FrMLPpmVgkyGSuHOdxW2gBTfK2yqqvvNdfLJbhUNWh3CVDvWI2PRDsOYjJ9a/rE4wvbQPYZyblQn5SIqdes5SpmP70SNdCrIteCpkWT2HR4ainFlBV5ZJK5slPM2MCnhXdX/zrNGgE1TLNP/KCbm4y2FRywA0ITuOYqIMrEsxoEHK313Z3nBjlH9kOU2xuj19CbBUQ7INBaJ6HZgO0AVsnMizcvTmm5Y1ZMRGexU1GYqaQZoxTBb6tgzhEfZKZhGGZrfg11m/eslEZIC9yvjlzM/F3FVZFNJSAg2sjw6UAR2PuIQ==
X-YMail-OSG: vIVkLr4VM1nnfFYcjKLPQjjqUKO7FG9f9FETyjP8yh8_26HO2LDTACtirJAoM0r
 u7JUQAW3eXxtNVhRC2i5S.YvMLkGJJYxNnQpBcDq8.oS66imL0w.YmLKRqfhVkDxhMk8RjJc14rW
 NZmmUI.6c8zuD36t432GjCOSHy46TFoMkiElLbQnYwt3jUpCCLJAjL6VHZSOQ9EFUxW_2FUIbV08
 4qV.Ex6N3HX1guolZPXznc350Jvku41t5wsyQIbZVETMN3Jkn7suW_inuVIfscxmtK78bHTbSxT0
 Gse0lkDmjxuBS1rWJh2LglhOWuqrxETtgQSThk9gdc5D7TqJW3ibA4T5kB1fFZinlEbAFBTc2GQi
 eZIEBLe6yeWqv9bwYN_C9ymA24WJEKIT1sH2lub4r7PTt597CiPh1MzP4lgA.9riAlDrIx5ZoizC
 6wYTTdie5uZB0GAW_RPEgRnBluBRvpEdMvZ320iPx1XgMuDVTC6ihY9VbnEix5QhJOMyEBNYx29T
 n5VH7huDM0Gj.DysWib9YU3_8XmIQCBTm5jHtrLJcVguyKVvKw9UJdX0Lc.aLRJVygO.fX3u11J6
 nWA4wWCsTuM49peZSp9xQYViL3dIg4YHvvYfXIbH7XYVByhRW_8Cc7L6YZDvbAdur_oZaQROHly9
 QOWmHKWjByk_kcQK.LL7EK406tYUXwcqJtkE4AWS5raWLpgwkOqJtE3NVmAJTIrmQcvdumHe8kR6
 RZ2ydVIJV1Z.gNDJl22R7DXryK8_PJPYw.3Gl7mEk9XbNTltrARFE2W7xBW.i8Y_cqcqlqMNopCX
 j.GRaQqboLK9zRPqqGeM0zxy.D8faptf4ufyIR4h15UkTRluEMx80.Ay9FTMSPSyyl01UZ39Q6xV
 oKgw9lIJ1Rn_JiVmPce_Z1wh.mB8e89_vMlz3NtTOqEYiaEpid.k2RSNVknAT1ekAQL6OJn_TCbv
 9pnRIY9MQbxzC718hjd85uawo3ZgA6GMvq3XgYlY42w198kR4KEt5CUz33tlv6X_6soXHv6x2e9_
 XW3mixBTSoL8dvB3mSC_vrCYRrZ9b3WHQwBXWTIESL62gXvp2rEK4oG6n5X.6CReYRIpjjn0GXJD
 PfbXSXiA0Q1Juh3bkf2554h4VpQQ80cdgm0cZDRwM8KEBqJ50DiDuvCIfbpuFWwcO3OtlfWZynEB
 TVgAku0_BHklHqx4d0rdbDhlQl0dz1ZooWuzNpJVmebrXO_gGmz8HaPR6uMXAMZdC1z6Q6mMyZl8
 xbtNcIKYY9qAcWwZXeQGvqQPvElbtHCnmsTSlpwBlFalPQ5GQtybQF0XIDy8kDHsIlR8FCDaHlmQ
 lUiGynfUfxF4YgqeCDFQKtxUEbjD.3lZSsVAxHatgv_Tf7lof79iKlrbsMUf0gmK84Tk5oO5iQpL
 s2wCAad0LsU9rM23.YKSwSyzPVYRvlE9l1FGn9HslvJxGehFINqksYohT1gbzwVb3a1XHtYT0yqo
 QkNLyjFoLoo2lwUegqVerPVT_AYk2HolXfqUfF92UVduJzKhToQUAsHPPQdHql3R1reyzzM0Ntj3
 UZCCj_6b1iGz2ZtnT.2ct2KNh4BAdTR2zHPSG9OcassV1eyF3Van4NfTgNHIQdtfUuwFQXdWl4XW
 xVY0sbQ0zqsjV1R3yIp7v4ymov6TnQHJ5wim45fEQhPi7PFPnwXxs3fYeyVtrS84.P3fGrSKDeJn
 3YWbD.S8HnTQrfzaK1V7g0t8AslT9NXWOEnMv6OivYJNdHh_UWrx1s2Y8QCM27Mz7tJo5O_vhhwk
 AxXNIwm_HrFKoi4UDYayx.hH.F4j3J617Eom5ziSoY_1mmYOYKCwDjffa8j18IH_13Q.aR9q7Y7f
 .SJmKA0S3hxTt9jFOGKmM7VUnf3vKywkFoALT9KoGz573Lmd7n06Cyvx5bZzT4GrTMQsfi9EdLJh
 8Z__gbiqgnD1IVNwBdojA777LHdba65hhYL8dSNpKeVW8PunAckTtJTAtiaigW3YVp1OWuJybP6R
 ggibxFgwbSkjy8.y6_DR1bONGy03ZgudDX19dzAz5eb1FWILuSwVMeT.zr3C_Y9DAg78QKVQFNDj
 HuR1iT2ppxWtxwyHUIUkLFP3nPCBuHGZCmxTEn36ntDRWykERGyWoDqbioU0v4UcbYMP.OWNJ03Y
 A1eJtV1_aFgqysbjqwvpE3czCAbM9N8LsYbsZGlQCOPnPnX_xejej.dWsh6foQLJOCVgvi9uQYNs
 QXkLV_09ruMEq_UyWJ6HWN3l1S2GUcqlKGQa1YWMSCWoHZfRIa18-
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Wed, 29 Jun 2022 12:13:57 +0000
Received: by hermes--canary-production-ir2-74b4d6d794-tv8mb (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID a99d5fff41219972254c35a43e83f973; 
 Wed, 29 Jun 2022 12:13:56 +0000 (UTC)
Message-ID: <b05c9019-5165-84f0-b3f1-a0eeb30faad1@yahoo.co.uk>
Date: Wed, 29 Jun 2022 13:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: lejeczek <peljasz@yahoo.co.uk>
Subject: package from fedorainfracloud for centOS 8 does not build
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <b05c9019-5165-84f0-b3f1-a0eeb30faad1.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.20280
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

Hi guys.

In case somebody here looks after 
'copr:copr.fedorainfracloud.org:jdoss:wireguard' then

wireguard-dkms-1.0.20220627-1.el8.noarch for 4.18.0-394.el8.x86_64 fails 
to build

many thanks, L.

