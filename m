Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52CAC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Apr 2022 03:15:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 54b3c4f8;
	Thu, 14 Apr 2022 03:15:02 +0000 (UTC)
Received: from sonic305-21.consmr.mail.ir2.yahoo.com
 (sonic305-21.consmr.mail.ir2.yahoo.com [77.238.177.83])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 310b3276
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 03:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1649906100; bh=0MF7zvv6vB9SN3a+HAOwoyhoh9GGt2oFK0TR2dtmILg=;
 h=Date:Subject:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=byO4XsG19BiCPzKp115IYbQHCz34cTI/tre6M4Ns8jyysg/xtMfkF8iMP8Dl3lB95fOgKV7Rz3Ey2cUGNGDAIkivzZzrjD9I14CkN60EC6KpIr6HktYWZWDkWNiOcHMKGbzKR+fhYqrUozKZ/g38U7bqz4qiUSwuMuCNs2lnKGRGnE1lNudvwW0e1E1i4boXvLNrFqlC/50EpgvUSWope0GGDF45AjHFUHtT7XnpVCKzdgwKbTEOV0GWAzZ4JsCnWPd6XP8f62ELBW+4JxYiRBTalImoiBgcYtQf9v4O9Bw+JB5MOLAbWHe8bhgqsXnF/92tfN/ZzyzoIj8P3C4hhQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1649906100; bh=inQ+7cPLQyP6TycnYU+Toq+7J50hcSyLemw88NRHGc9=;
 h=X-Sonic-MF:Date:Subject:From:From:Subject;
 b=qEMQTIdGeEmz8ZAHQAAxEg1hPDHarYWrqxsyFHC4TrgxZVmz8aotwm+0jvOcLxQVmCi1dVS3wwkeUoxZ2ap5UQJvLkwJxnOtnO6bp+1IUOA9aHWSLY5JwLtaIhyhr3WpxPBaNLPBDflAtquT/Jxtw8JVtqv8T0+PrFd1aaDPcjAEpLBRq0wb9lamh7P0UvYp5dDuALbCtx3QE8QONzxiBF2+w29+cBTok0RhKWSFWN+I9gx+7pIFIuzuQ7l7eLYb3Ur4no+XTOVN12N8UpsMMTe3tRn4UYcQlxxS5YF3uxlhCCNsaLEaN128T3bP4lW53iKas+Fjojek/YBGrCydLA==
X-YMail-OSG: pYGu4EYVM1lth2oljBoPw5S1VfiTidYjCeS1VNh3HJfHpZT.12OMaCRuCFmNDtd
 9ol8yRpImsfssOzCZoXoHeZbjRfQylaXYqGEP3oETVYHDpjcnfk6B2H843WMtIi4yPQ4RglONTEQ
 eLt7KYIgWANIsVUze9WpPczjdO9iK8kgUglicWLplugA4ah5BzFhVaUwMV1B_h_iQ6VSjyJksQem
 ellULxTcxmicGl9ckJGl_.EwlPn0qTqpaltkpEHxEAYoFdyFSA7I7vzPhTU4VtelacIkeSKhCxaP
 T_w4pE4vjZwa6NqkO3hGufcoJGkL6N8MOGu8DNomN4oP7djZ0fM5XB7n0QJYlys3tc9taLCxyOnB
 wGspgROLsc1CXt5eYuylx.Fk16kp7NApgEiSYpI7uRXy8QlN6AkH6ykAt4wTTb4ig7zTCgKhritt
 IIcnfcfm2B6fFHZjWQUrIbvhIFQG0GpUm.pzSbyumgpw5cYL.3J6VCjOVARwQiCGiikSyLewVyNj
 v1qm2tpeS4Nqt1pV_3FSYkvMLALjhUn6_eQuMvqWtpnHUAPbl7ZX9c62xxjM69HwMKajseYmMKDx
 oaD2pv6t.7o1EzNSb1xMvSMAAHMcd7fgALWaFrWgru8wQ3cFxKOwGS.CCAO8zwCUEFc4kGKOZJKA
 zf7e3FmXDm6VoGH.4VCSlaGD1n3BtvqE4Sy0dnueSj0T2dceANC7pBsxv7dt_fkDfmo1RHavYK_4
 pUqPX6xM0fZhOy8SQbNHzRqEa4rYXTwH5zrSOVwHunhkjwKDFXhM8lOY1zT4EpHW0k8xbcN7fnKn
 rtLp0DSgQr1gNpJ9RQkr099T5VjdLAjQhsMLmVpHxHwwyEDKFOwd9s8CE_D1v9dbzEbOccpG3U6Q
 gOtJi1nCiIRlhMHyE9hG43K6HKhq41lmgZuTLvgC2KUVJP43.J2TjOwzPRgJ0i1ctLTa.kQ4FdAt
 s2_sUkNPm_v7Yx8Y8DNU5PM7gvodAQMlVxhuwZDui9FHsyx0ZvNr2Nkf9YB8AsoFiazjiZjrHZoo
 vGfsXUDv1Ru_onIq3S6eF9o0vJQGejTur952XzpK2q4QyWwv5lp28UE0QJoEQwzM4P08fr085KJr
 SMKtUSXrFw8_x4I_B9KxVclvCPfx4uWaXlOSKF91jbee8s3hp4vxtxgzktmxZKrXF_gHsCLATuAM
 orL1p9OLKLdNO3mAnxs_T8FTOD4gXgz2vcTlzOhUm6b36FyOXVZqIKUY_yF0fKuBfgetipRUxi3A
 vsica36S4ORo7Vaf3.FWRi7l0iqT4SDo8bCNMx65ZNaP0phsXERII5bsRywq7tCiE0i.ZeqDR5x4
 ctgg8znMAgk7M2l5ujC1C92UzUvqVRAJS96eDBeNcd.XlwTot1T1jfyKHJCi_ilTATFB_jfuaJSI
 W5DRpxcEgLbR_xFYLB3qgx41YeJ9aeSTbLi3CwMcBQPqzqr3n9rfrofwJvfIYBZXxN82FmolJGOQ
 MQTDzP9e7NFgOmIcV9sG60QNiyH9TCnEh6DQb1DHxnd7QfnPG9OJldnkRTvwGIkNj4OoaPCfM5s8
 n_J_rhu4am7gQl0GeULhAN2Rv6mKCqKdkUa48THFmCd.yWnPHQPAIKA_pDwnwh9m8t4fe0FcIClF
 MunWuikfDGVJ4Qx1TkhDVvrilWgEcPRRJ5cFm3NW3XD5XafnAZ.RXxuNc7mnDul6bCWfiy5dvJxd
 psytf0T_NWOfntZueOb0_lRZwhK4zv4qgw.l0XdBoYhTmGTgVeW_VHISZbSxy9V9psjsEONNEYPN
 bl5iFWoOgl5sCxNx0CF2IS6nHzq3AQvmYmbOyw8kHoJcAz71c2XfDY.1BKbZ0KHgJuRg83_6gx9j
 sfxWYaGztwdA9GS7HH.zvTX7LoVDOO4ID3UV4lX7bfCPRACJwfU34DRP5m0bxTQ9aCxH9gLnWwcT
 Wjmh2nnNy.dvgXPPmUQ90cBBcVY7w9ApF__6l1dD2N506DXCt_Y0jBvFoB5JmuiBay66jG63le8.
 .je64YlINtoAy7UPwm9Ijl_I34SAjaVBBynu6l17Nwzz5Q1yFo1n_qCtxaLpJTEaaBsEZJgJHNm8
 _smCX3E6.q1pbbbrxe5VZpSzbGhzEu_9UzOuQR8Ni527NlscRsEv4OXeVvnjMO7iB4CAWgGq4jDK
 E1eK0V7DhFWf0lgSMot7yAX80rf4jhfkg6nCMGmjX2I1lvh.pbY.xbm0Qji0twFr_tEXan.bWsbn
 mqqHtkjWUf6b7Trlyf3IOwrTdX.BNb8_GhWV4bSU1RxaFmA6DcvUrTDgj_wYho8l8vjlYr.yrSQX
 p448Tdg--
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ir2.yahoo.com with HTTP; Thu, 14 Apr 2022 03:15:00 +0000
Received: by hermes--canary-production-ir2-7d675798cc-zrsbx (VZM Hermes SMTP
 Server) with ESMTPA ID 3eb85c9f689f6bf00a90ca2435915fbd; 
 Thu, 14 Apr 2022 03:14:55 +0000 (UTC)
Message-ID: <20ec95e3-ce3e-8fc7-4e46-c379e719a665@yahoo.co.uk>
Date: Thu, 14 Apr 2022 04:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: error - ? - Address already in use
Content-Language: en-US
Cc: wireguard@lists.zx2c4.com
References: <077cdb1c-e06c-d2fd-1475-269ed744d5ca.ref@yahoo.co.uk>
 <077cdb1c-e06c-d2fd-1475-269ed744d5ca@yahoo.co.uk>
 <20220414024510.4f980d24@inspiro.localdomain>
From: lejeczek <peljasz@yahoo.co.uk>
In-Reply-To: <20220414024510.4f980d24@inspiro.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 13/04/2022 20:45, Shulhan wrote:
> On Wed, 13 Apr 2022 18:45:24 +0100
> lejeczek <peljasz@yahoo.co.uk> wrote:
>
>> Hi guys
>>
>> what is below error the symptom of?
>>
>> -> $ wg-quick up wg-r2
>> [#] ip link add wg-r2 type wireguard
>> [#] wg setconf wg-r2 /dev/fd/63
>> [#] ip -4 address add 10.3.3.254/24 dev wg-r2
>> [#] ip link set mtu 1320 up dev wg-r2
>> RTNETLINK answers: Address already in use
>> [#] ip link delete dev wg-r2
>>
>> I'll only add that I looked into "obvious" places and found
>> nothing.
>> many thanks, L.
> My guess is another wg network is already up using the same IP address.
> You may check using `wg show` to see the active endpoint or other
> net tools like `ip` or `ifconfig` to list of active net devices.
>
This message is _pretty_ deceptive as it's the 'port' which 
is the culprit - if used already by instantiated wg iface.

btw. @mailman admins - this mailing list has DMARC breaking, 
those of us who use yahoo, delivery of own messages.

thanks, L
