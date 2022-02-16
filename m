Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC866C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Feb 2022 14:43:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bf62455c;
	Wed, 16 Feb 2022 14:43:28 +0000 (UTC)
Received: from sonic310-11.consmr.mail.ir2.yahoo.com
 (sonic310-11.consmr.mail.ir2.yahoo.com [77.238.177.32])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ee179d9b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Feb 2022 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1645022605; bh=B3OyNiv3UxMPhABvPiznzGLRLBE9zUISFrV58YblEVE=;
 h=Date:To:From:Subject:References:From:Subject:Reply-To;
 b=XsYAKFMMcA9mjubZH66OuxvixWaS6QBRwQgIa9FYMftmTdhH7nmI5S6UtLB7k8SoPTu1qfUVP3K3hOSp6JijWdj/czDFXYj11BJDadiBh2AsicyJHAlfhvbRM3Jh2XOkukE4e7/YCqcKAYdt8erGnVxOgmTHrGWcQWn+CyfM6C/IlL/lQHSuYMalWvWrvRxq6uV/Sfecrleyx2kM540TrtcA5a8p1n63j+ADp10+R/i5BALdjmYXGdFn29X9PiexqVbmn3PuQ8zVwmlJgp9aZweWZeOavdfxc62/XXZyW1Yde9P1juFLpx1UnV+yP0JT+U633THhV8WpcifwUiFw5Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1645022605; bh=uCW/a5II4U78QKjJEFMue9U15g9Nhzg4AMQX7rBJ2fL=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=uQCbB7TcwOwwoGbpmsqrVaal1cN/nO/XyBbBo7BdIijuP2VdoqJi5gHACHU3VNmBHC6ipmx3UYnRdk54N9e+ANQNtHjLRccwqZFPRix4N5BMiGdMFYJN7hZt1EgUB3HuIvoPq0nxNyA6ZuWrYkUoEZtqW9X07RoQbFLDCXyPwIC1r/xm0EWJyDc+oJgUkTFxAjxZlt2gbDK0RNVJ8sjpbJ+2q34uqNmK3VU08ezOj1uu6GqtVgZ1pXZrr4Ih8cm3c2gWMFWAbHCKaPkHyOAnGYvd2if9oP+sMD24eyUvLitj1JL1FFVXAKMxMSVyWuBVdk4vAGPfqaSEeDOKswPKBQ==
X-YMail-OSG: R1kKpr0VM1mpq25T12wGTbkx2dJOatq4csvXQreqORrg7vb4S5p5ucePh9DPEZZ
 FWIDr4SMEglARZw8iAvEhgf81oqiYWFM.qdHrDxNcZNIgQUcEPVoQUFpwK3VlpMtTZZP3Nxtw0T7
 p8GCB78Di1KUFf2tiA_h64qJ0plPWZuU0a.zZ7DfzFL4iO1NXRQyv_ZKI0jmsfRDnPosTCUTXVFZ
 2XKmm_EXvsBfdWXNKDYAMC.jvRcPTBPSZ_9FhZ8anqjMQQLhSzP9Bu0QJhL6zD7_glEXjlL.wOQu
 NzF7yERSgf01Qs_Xsz7TPc1tb75A08i1Kl0ZZKD30aV.mENnFd46u01InrQ3td_paNov3P_wjFoA
 yDiq6KEIL0BasK1KVgWv0y5TjrbUL6XOkAtY3kuf8Iwk1v0ls30KWY_3YqnOmw1RaXjrLqlqi1r4
 qVUBi6GupZyAsgwkxNddEiqYSy3gSWzIC7nQVEK_zVm1Q0JSu2DhaagGmS9xCmBAytDUFGyESvc0
 ra38zJTGgRsqrs8Qo3FDvCUM0u5x67VrmGm3UHhl_MecMZHqq5_HuAUmnCNIobELelzIiKjbd_qe
 XgbtdU93UVc6plrgfU2HHggMpfl09WA43oFhjzlWag5r9DicJqbJsrAYLVuC1PYz2bzLZBswJ2vA
 0xYb7ukRmYTxL8BG0xIMDcaGsBSgbDmAOgqv67ZuCVzQGXdsaHODQFncruUuZuuV__A3lcy.1N92
 XNrNVBngo0QD6LURzwRFDFO27EIuQ5NI.98qasovyr5l0_i08G9yugq3oQhnzD7zNn54m0dHVCgq
 GPQ5rbsCHwaYTplGK.CqI7a9X_VvFejAgSWWVMs3pQ7s8s4QMp_Q3z1rhw5A9ly7j5KPtOUJpZ5G
 mJj.1CEEGNEQQnZ8ih33gs7QtTCq1bLjBSAc1wFJzRJS.Qqzk8KiWn9QCy68YaFQLIo_PCzoRVlI
 WkcxNIExnfYmTxE5zRaHgk_xycdn3lNRv72fvtZ.YHH2DoS00ZS0D8VkV5H_77.l7fPNWbDxZRe2
 fpAiP.xisREPbKXwBxeU72YUiKOidN6dHm_P8SCHNq5moNDYlQ_Hfhunx6KOsM0jjlv5rDj1vNID
 cgBFxEGTOyIKOrQbUwu40O0DkgwMc8yEQpHuKJTigBn4UqemrdWoM5eJsdIkaaeEM9WhUtWLqI9Y
 5jfHdn5yCKG8hz3_2G2idDYFuQa3MG1kpgxLIQjdN_K3jWMgbIwqTNdaeYK0.vt19TQyFZtA_CV4
 pdhMJ8v56ZrMGNLW4lYnVY9yI8oNPhud0t1USKN1l4ZtRxIEPAE4GtvdPYMuGyLdqKK5gZJI.T.G
 5rW8_n_jPbeJdvBEmgU6xrXANkvPDZxams_OIEV3BGqvf2lFu6Qh_rYQeQVucwLdbn3G0RV2IzI_
 n3qwp2oOelObNkhcmZtE.oIqwgzFoucHBMYncrnNDd8Ti3nMqTeQjx0qjzkeT_1O7Z0LbyisOXiI
 GEZ938Ea0tAAcf4WSaNi9IU50kv0EngZBQnI2Fn66Hy1H1356G0EHKehPC3AdePY6OWWhxEHEkzI
 xHgznS0mROE07rhi_e8Qfj9DjnZX2dtKGhTfFSU0aLSTQe0qD8aZXtGX_Asb1veRIrZaqGQTCixz
 PN.MB4rKhZ8K0QosHiN2h0xzoLei3pFYZeIm0SPxnPFwCCtq6PV.DE8CqhQn2zIsyWImlulZtCw6
 Tkux7UmPzZ_lLUJgAL1DGnqTISESHqr5YVao.lwkcAbj1HoQR90QonBLIMu1jsEkGz674JvIiPyg
 r3hryp2V8LbWp04ap2fqs1HyFCvl4P4jPv_ts8pWsxTYz9PDlLdlnV8p0p17dpf_1trKmrLwvHXf
 SHWCajot.yCpQFskx1pvkBCXcurBQ9jHtwEh7zRkP9TEL4misCNeGQiC57olt8vLS_0NRfdfc_Dx
 CCnEyNVYz9DKJUB760vu.G7eUPUwK9Gzl2SoGIRvjtji6lVP6ciyyJwj55UQLNmjDiHXMr45yS_M
 NUZrx_DCft5EtFzqe.04VMVAuuSmewM25UXoHPv3q0XfqOBlkhkvx8BFaCn6uFxoHGD1W9bZy2vg
 rWAxN4hDLED7fm0CjE_dkmdDWdvTMDqrnjSxPaYckSuvrV.1G4Kp4kPTMy3uKh3XDQwLgpFoDLFq
 bEpPtKxSuc06eMEh3xg5gBb7wARla4bNZJEnSAXsMxPrdU2eEeZa_r.DSsjXlLDaZVRA6VgGoU45
 z8PhM4XFD1tdwHrXtz2QZnc_ViAZBi7Rv0RR.rmtIY52Kqq3VRGpcyHFIy9N0
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ir2.yahoo.com with HTTP; Wed, 16 Feb 2022 14:43:25 +0000
Received: by kubenode503.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 4a02dfb9b1cb08d19f390cdf20679dc3; 
 Wed, 16 Feb 2022 14:43:23 +0000 (UTC)
Message-ID: <59b73202-4c8c-2ff2-fca8-209cc3f3ac54@yahoo.co.uk>
Date: Wed, 16 Feb 2022 14:43:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: lejeczek <peljasz@yahoo.co.uk>
Subject: firewall / port forward - ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <59b73202-4c8c-2ff2-fca8-209cc3f3ac54.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.19724
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

I'm still new to wireguard and still not an expert on network stack so I 
struggle with something what might be trivial.

A roadwarrior when connected to the server sees a forward-port on 
server's internal network as 'closed':

10.3.9.10 -> 10.3.9.1 <server> 10.3.1.1 (port forward) => 10.8.9.1 (a 
dummy iface, still server)

but rest of 10.3.1.0/24 sees that forwarded port - as I expected - as 'open'

If that same server port is not forwarded ("stays" on 10.3.1.1) then 
that roadwarrior sees the port as 'open'

I've fiddled with firewall all I could so I think it's not in there - 
thus hoping expert(s) can help me wrap my head around it.

many thanks, L.


