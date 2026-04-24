<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MindAcademy — Pitch</title>
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:ital,wght@0,300;0,400;0,500;1,300&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
 
  :root {
    --green:  #1A6B4A;
    --green2: #24966A;
    --lime:   #B8F0D4;
    --dark:   #0E1A14;
    --muted:  #6B8070;
    --white:  #FFFFFF;
  }
 
  html { scroll-behavior: smooth; }
  body { font-family: 'DM Sans', sans-serif; background: var(--dark); color: var(--white); overflow-x: hidden; }
 
  .slide {
    min-height: 100vh; width: 100%;
    display: flex; flex-direction: column;
    justify-content: center; align-items: center;
    padding: 60px 40px; position: relative;
    opacity: 0; transform: translateY(40px);
    transition: opacity 0.8s ease, transform 0.8s ease;
  }
  .slide.visible { opacity: 1; transform: translateY(0); }
 
  #progress-bar {
    position: fixed; top: 0; left: 0; height: 3px;
    background: var(--lime); width: 0%;
    transition: width 0.4s ease; z-index: 100;
  }
 
  #nav-dots {
    position: fixed; right: 24px; top: 50%;
    transform: translateY(-50%);
    display: flex; flex-direction: column; gap: 10px; z-index: 100;
  }
  .dot {
    width: 8px; height: 8px; border-radius: 50%;
    background: rgba(255,255,255,0.2); cursor: pointer;
    transition: background 0.3s, transform 0.3s;
  }
  .dot.active { background: var(--lime); transform: scale(1.4); }
 
  .section-tag {
    font-family: 'Syne', sans-serif; font-size: 11px; font-weight: 600;
    letter-spacing: 0.15em; color: var(--green2);
    text-transform: uppercase; margin-bottom: 20px;
  }
  .slide-title {
    font-family: 'Syne', sans-serif;
    font-size: clamp(32px, 5vw, 58px); font-weight: 800;
    line-height: 1.1; letter-spacing: -1.5px;
    max-width: 700px; text-align: center;
  }
  .slide-title em { color: var(--lime); font-style: normal; }
 
  /* SLIDE 0 — CAPA */
  #s0 { background: var(--dark); text-align: center; overflow: hidden; }
 
  /* SLIDE 1 — GANCHO */
  #s1 { background: var(--dark); text-align: center; }
  #s1::before {
    content: ''; position: absolute; inset: 0;
    background: radial-gradient(ellipse 70% 60% at 50% 50%, rgba(36,150,106,0.15) 0%, transparent 70%);
    pointer-events: none;
  }
  .stat-number {
    font-family: 'Syne', sans-serif;
    font-size: clamp(72px, 14vw, 140px); font-weight: 800;
    color: var(--lime); line-height: 1; letter-spacing: -4px;
  }
  .stat-label {
    font-size: clamp(16px, 2.5vw, 22px); color: rgba(255,255,255,0.55);
    font-weight: 300; max-width: 480px; line-height: 1.6; margin-top: 16px;
  }
 
  /* SLIDE 2 — PROBLEMA */
  #s2 { background: #0A1510; }
  .problem-grid {
    display: grid; grid-template-columns: repeat(3, 1fr);
    gap: 16px; margin-top: 40px; max-width: 760px; width: 100%;
  }
  .problem-card {
    background: rgba(255,255,255,0.04);
    border: 0.5px solid rgba(255,255,255,0.08);
    border-radius: 16px; padding: 28px 22px; text-align: center;
    transition: border-color 0.3s, background 0.3s;
  }
  .problem-card:hover {
    border-color: rgba(184,240,212,0.3);
    background: rgba(36,150,106,0.08);
  }
  .problem-icon { font-size: 32px; display: block; margin-bottom: 14px; }
  .problem-card h3 {
    font-family: 'Syne', sans-serif; font-size: 15px; font-weight: 700;
    margin-bottom: 8px; color: var(--white);
  }
  .problem-card p { font-size: 13px; color: var(--muted); line-height: 1.6; }
 
  /* SLIDE 3 — SOLUÇÃO */
  #s3 { background: var(--dark); }
  .mockup-frame {
    width: 100%; max-width: 660px; background: #141E18;
    border: 1px solid rgba(255,255,255,0.1);
    border-radius: 16px; overflow: hidden;
    box-shadow: 0 40px 80px rgba(0,0,0,0.5); margin-top: 32px;
  }
  .mockup-topbar {
    background: #1A2820; padding: 10px 16px;
    display: flex; align-items: center; gap: 8px;
    border-bottom: 1px solid rgba(255,255,255,0.06);
  }
  .dot-r { width:10px;height:10px;border-radius:50%;background:#D94F3D;flex-shrink:0; }
  .dot-y { width:10px;height:10px;border-radius:50%;background:#E8A020;flex-shrink:0; }
  .dot-g { width:10px;height:10px;border-radius:50%;background:#24966A;flex-shrink:0; }
  .url-bar {
    flex: 1; background: rgba(255,255,255,0.06);
    border-radius: 6px; padding: 5px 12px;
    font-size: 12px; color: var(--muted);
  }
  .sga-tabs {
    display: flex; border-bottom: 1px solid rgba(255,255,255,0.06); overflow-x: auto;
  }
  .sga-tab {
    padding: 12px 20px; font-size: 12px; font-weight: 500;
    color: var(--muted); white-space: nowrap; cursor: pointer;
    border-bottom: 2px solid transparent; transition: color 0.2s;
  }
  .sga-tab.active { color: var(--lime); border-bottom-color: var(--lime); background: rgba(184,240,212,0.04); }
  .sga-tab.highlight { color: var(--lime); font-weight: 700; position: relative; }
  .sga-tab.highlight::after {
    content: '✦ NOVO'; position: absolute; top: 4px; right: 4px;
    font-size: 8px; font-weight: 700; background: var(--green2);
    color: var(--white); padding: 1px 5px; border-radius: 4px; letter-spacing: 0.05em;
  }
  .sga-content { padding: 24px; }
  .sga-panel { display: none; }
  .sga-panel.active { display: block; }
  .apoio-header { display: flex; align-items: center; gap: 14px; margin-bottom: 20px; }
  .apoio-icon {
    width: 44px; height: 44px; border-radius: 12px;
    background: rgba(36,150,106,0.25);
    display: flex; align-items: center; justify-content: center; font-size: 22px;
  }
  .apoio-header h3 { font-family: 'Syne', sans-serif; font-size: 16px; font-weight: 700; color: var(--white); }
  .apoio-header p { font-size: 12px; color: var(--muted); }
  .apoio-form { display: flex; flex-direction: column; gap: 10px; }
  .apoio-form label { font-size: 11px; color: var(--muted); font-weight: 500; }
  .apoio-form select, .apoio-form textarea {
    background: rgba(255,255,255,0.05);
    border: 0.5px solid rgba(255,255,255,0.1);
    border-radius: 8px; padding: 10px 12px; font-size: 13px;
    color: var(--white); font-family: 'DM Sans', sans-serif; width: 100%; outline: none;
  }
  .apoio-form select option { background: #1A2820; }
  .apoio-btn {
    background: var(--green2); color: var(--white); border: none;
    border-radius: 8px; padding: 12px; font-size: 14px; font-weight: 600;
    font-family: 'Syne', sans-serif; cursor: pointer;
    transition: background 0.2s, transform 0.1s; margin-top: 4px;
  }
  .apoio-btn:hover { background: var(--green); }
  .apoio-btn:active { transform: scale(0.98); }
  #success-msg {
    display: none; background: rgba(36,150,106,0.15);
    border: 1px solid rgba(36,150,106,0.4); border-radius: 10px;
    padding: 16px; text-align: center; font-size: 14px;
    color: var(--lime); margin-top: 8px;
  }
  .generic-panel { text-align: center; padding: 30px; color: var(--muted); font-size: 13px; }
 
  /* SLIDE 4 — COMO FUNCIONA */
  #s4 { background: #0A1510; }
  .flow-steps {
    display: flex; flex-direction: column; gap: 0;
    max-width: 600px; width: 100%; margin-top: 40px;
  }
  .flow-step {
    display: flex; align-items: flex-start; gap: 20px;
    padding: 20px 0; position: relative;
  }
  .flow-step:not(:last-child)::after {
    content: ''; position: absolute; left: 19px; top: 60px;
    width: 2px; height: calc(100% - 40px);
    background: rgba(36,150,106,0.3);
  }
  .step-num {
    width: 40px; height: 40px; border-radius: 50%;
    border: 2px solid var(--green2); flex-shrink: 0;
    display: flex; align-items: center; justify-content: center;
    font-family: 'Syne', sans-serif; font-size: 14px; font-weight: 800;
    color: var(--lime); background: rgba(36,150,106,0.1);
  }
  .step-content h3 {
    font-family: 'Syne', sans-serif; font-size: 17px; font-weight: 700;
    color: var(--white); margin-bottom: 6px;
  }
  .step-content p { font-size: 14px; color: var(--muted); line-height: 1.65; }
  .trigger-tags { display: flex; flex-wrap: wrap; gap: 8px; margin-top: 8px; }
  .ttag { font-size: 11px; font-weight: 600; padding: 4px 12px; border-radius: 20px; letter-spacing: 0.03em; }
  .ttag-r { background: rgba(217,79,61,0.15); color: #F08070; border: 0.5px solid rgba(217,79,61,0.3); }
  .ttag-y { background: rgba(232,160,32,0.15); color: #F0C060; border: 0.5px solid rgba(232,160,32,0.3); }
  .ttag-g { background: rgba(36,150,106,0.15); color: var(--lime); border: 0.5px solid rgba(36,150,106,0.3); }
 
  /* SLIDE 5 — CTA */
  #s5 { background: var(--green); text-align: center; overflow: hidden; }
  #s5::before {
    content: ''; position: absolute; inset: 0;
    background: radial-gradient(ellipse 80% 80% at 50% 110%, rgba(0,0,0,0.5) 0%, transparent 60%);
  }
  #s5::after {
    content: 'MINDACADEMY'; position: absolute;
    font-family: 'Syne', sans-serif; font-size: clamp(80px,16vw,180px);
    font-weight: 800; color: rgba(255,255,255,0.04);
    top: 50%; left: 50%; transform: translate(-50%,-50%);
    white-space: nowrap; pointer-events: none; letter-spacing: -4px;
  }
  .cta-tag {
    font-family: 'Syne', sans-serif; font-size: 11px; font-weight: 700;
    letter-spacing: 0.18em; color: rgba(255,255,255,0.6);
    text-transform: uppercase; margin-bottom: 24px; position: relative; z-index: 2;
  }
  .cta-title {
    font-family: 'Syne', sans-serif;
    font-size: clamp(28px, 5vw, 54px); font-weight: 800;
    line-height: 1.1; letter-spacing: -1.5px;
    max-width: 660px; margin-bottom: 32px; position: relative; z-index: 2;
  }
  .cta-sub {
    font-size: clamp(14px, 2vw, 18px); color: rgba(255,255,255,0.65);
    max-width: 460px; line-height: 1.7; margin-bottom: 40px;
    font-weight: 300; position: relative; z-index: 2;
  }
  .cta-btn {
    display: inline-block; background: var(--white); color: var(--green);
    padding: 16px 40px; border-radius: 50px;
    font-family: 'Syne', sans-serif; font-size: 15px; font-weight: 800;
    letter-spacing: 0.04em; cursor: pointer; border: none;
    transition: transform 0.2s, box-shadow 0.2s; position: relative; z-index: 2;
  }
  .cta-btn:hover { transform: translateY(-3px); box-shadow: 0 12px 40px rgba(0,0,0,0.3); }
 
  /* NARRAÇÃO FLUTUANTE */
  .narr-box {
    position: fixed; bottom: 24px; left: 50%; transform: translateX(-50%);
    background: rgba(14,26,20,0.92); backdrop-filter: blur(12px);
    border: 0.5px solid rgba(184,240,212,0.2); border-radius: 12px;
    padding: 12px 20px; max-width: 680px; width: calc(100% - 48px);
    font-size: 13px; font-style: italic; color: rgba(255,255,255,0.6);
    line-height: 1.6; text-align: center; z-index: 99;
  }
  .narr-box span {
    color: var(--lime); font-style: normal; font-size: 10px; font-weight: 600;
    letter-spacing: 0.1em; display: block; margin-bottom: 4px; text-transform: uppercase;
  }
 
  @media (max-width: 600px) {
    .problem-grid { grid-template-columns: 1fr; }
    .slide { padding: 40px 20px; }
    #s5::after { display: none; }
  }
</style>
</head>
<body>
 
<div id="progress-bar"></div>
 
<div id="nav-dots">
  <div class="dot active" onclick="goTo(0)"></div>
  <div class="dot" onclick="goTo(1)"></div>
  <div class="dot" onclick="goTo(2)"></div>
  <div class="dot" onclick="goTo(3)"></div>
  <div class="dot" onclick="goTo(4)"></div>
  <div class="dot" onclick="goTo(5)"></div>
</div>
 
<div class="slides">
 
  <!-- CAPA -->
  <section class="slide" id="s0">
    <div style="position:absolute;inset:0;pointer-events:none;overflow:hidden;">
      <div style="position:absolute;width:600px;height:600px;border-radius:50%;background:radial-gradient(circle,rgba(36,150,106,0.18) 0%,transparent 70%);top:50%;left:50%;transform:translate(-50%,-50%);"></div>
      <div style="position:absolute;width:900px;height:900px;border-radius:50%;border:0.5px solid rgba(184,240,212,0.07);top:50%;left:50%;transform:translate(-50%,-50%);"></div>
      <div style="position:absolute;width:650px;height:650px;border-radius:50%;border:0.5px solid rgba(184,240,212,0.05);top:50%;left:50%;transform:translate(-50%,-50%);"></div>
    </div>
    <div style="position:relative;z-index:2;display:flex;flex-direction:column;align-items:center;">
      <div style="width:56px;height:56px;border-radius:16px;background:rgba(36,150,106,0.2);border:1px solid rgba(184,240,212,0.25);display:flex;align-items:center;justify-content:center;font-size:26px;margin-bottom:24px;">🧠</div>
      <h1 style="font-family:'Syne',sans-serif;font-size:clamp(56px,12vw,110px);font-weight:800;letter-spacing:-4px;line-height:0.95;color:var(--white);margin:0;">Mind<span style="color:var(--lime);">Academy</span></h1>
      <p style="font-family:'Syne',sans-serif;font-size:clamp(13px,1.8vw,17px);color:rgba(255,255,255,0.35);letter-spacing:0.18em;text-transform:uppercase;margin:20px 0 0;">Saúde Mental Integrada ao Portal Acadêmico</p>
      <div style="width:40px;height:1px;background:rgba(184,240,212,0.3);margin:28px auto;"></div>
      <p style="font-size:13px;color:rgba(255,255,255,0.25);letter-spacing:0.08em;font-weight:300;">Role para começar ↓</p>
    </div>
  </section>
 
  <!-- SLIDE 1: GANCHO -->
  <section class="slide" id="s1">
    <div class="section-tag">Saúde Mental nas Faculdades</div>
    <div class="stat-number">1 em 4</div>
    <p class="stat-label">universitários sofre com ansiedade ou depressão durante a graduação — e a grande maioria nunca recebe nenhum acompanhamento.</p>
  </section>
 
  <!-- SLIDE 2: PROBLEMA -->
  <section class="slide" id="s2">
    <div class="section-tag">O problema</div>
    <h2 class="slide-title">O cuidado existe.<br><em>O acesso não.</em></h2>
    <div class="problem-grid">
      <div class="problem-card">
        <span class="problem-icon">📋</span>
        <h3>Burocracia</h3>
        <p>Quem sofre raramente tem energia para navegar em sistemas complexos ou aguardar filas de espera.</p>
      </div>
      <div class="problem-card">
        <span class="problem-icon">🔕</span>
        <h3>Invisibilidade</h3>
        <p>O aluno que se isola e desaparece da turma não aparece em nenhum relatório institucional.</p>
      </div>
      <div class="problem-card">
        <span class="problem-icon">⏳</span>
        <h3>Demora</h3>
        <p>Quando o atendimento chega, a crise já escalou — com impacto direto em notas e desistências.</p>
      </div>
    </div>
  </section>
 
  <!-- SLIDE 3: SOLUÇÃO -->
  <section class="slide" id="s3">
    <div class="section-tag">A solução</div>
    <h2 class="slide-title">Apoio no lugar<br><em>onde o aluno já está.</em></h2>
    <div class="mockup-frame">
      <div class="mockup-topbar">
        <div class="dot-r"></div>
        <div class="dot-y"></div>
        <div class="dot-g"></div>
        <div class="url-bar">portal.faculdade.edu.br/sga</div>
      </div>
      <div class="sga-tabs">
        <div class="sga-tab" onclick="switchTab('inicio')">Início</div>
        <div class="sga-tab" onclick="switchTab('notas')">Notas</div>
        <div class="sga-tab" onclick="switchTab('historico')">Histórico</div>
        <div class="sga-tab highlight active" onclick="switchTab('apoio')">🧠 Apoio Psicológico</div>
        <div class="sga-tab" onclick="switchTab('financeiro')">Financeiro</div>
      </div>
      <div class="sga-content">
        <div class="sga-panel active" id="tab-apoio">
          <div class="apoio-header">
            <div class="apoio-icon">🧠</div>
            <div>
              <h3>Solicitar acompanhamento</h3>
              <p>Confidencial · Resposta em até 24h</p>
            </div>
          </div>
          <div class="apoio-form" id="apoio-form">
            <label>Como você está se sentindo?</label>
            <select>
              <option>Ansiedade ou estresse excessivo</option>
              <option>Tristeza ou desmotivação</option>
              <option>Dificuldade de concentração</option>
              <option>Problemas de sono</option>
              <option>Outros</option>
            </select>
            <label>Quer nos contar mais? (opcional)</label>
            <textarea rows="2" placeholder="Escreva à vontade…"></textarea>
            <button class="apoio-btn" onclick="submitApoio()">Solicitar atendimento →</button>
          </div>
          <div id="success-msg">✅ Solicitação recebida! Um profissional entrará em contato em até 24 horas. Você não está sozinho(a).</div>
        </div>
        <div class="sga-panel" id="tab-inicio"><div class="generic-panel">Painel inicial do SGA</div></div>
        <div class="sga-panel" id="tab-notas"><div class="generic-panel">Histórico de notas</div></div>
        <div class="sga-panel" id="tab-historico"><div class="generic-panel">Histórico acadêmico</div></div>
        <div class="sga-panel" id="tab-financeiro"><div class="generic-panel">Informações financeiras</div></div>
      </div>
    </div>
  </section>
 
  <!-- SLIDE 4: COMO FUNCIONA -->
  <section class="slide" id="s4">
    <div class="section-tag">Inteligência proativa</div>
    <h2 class="slide-title">O sistema age<br><em>antes da crise.</em></h2>
    <div class="flow-steps">
      <div class="flow-step">
        <div class="step-num">1</div>
        <div class="step-content">
          <h3>Aluno solicita pelo SGA</h3>
          <p>Um clique, confidencial, sem instalar nada. O apoio está onde ele já está.</p>
        </div>
      </div>
      <div class="flow-step">
        <div class="step-num">2</div>
        <div class="step-content">
          <h3>Sistema detecta sinais de risco</h3>
          <p>Cruza dados do portal e identifica padrões de alerta automaticamente:</p>
          <div class="trigger-tags">
            <span class="ttag ttag-r">🔴 Faltas recorrentes</span>
            <span class="ttag ttag-y">🟡 Notas em queda</span>
            <span class="ttag ttag-g">🟢 Avaliação negativa por pares</span>
          </div>
        </div>
      </div>
      <div class="flow-step">
        <div class="step-num">3</div>
        <div class="step-content">
          <h3>Profissional entra em contato</h3>
          <p>Notificado automaticamente, aborda o aluno de forma humanizada e sigilosa.</p>
        </div>
      </div>
      <div class="flow-step">
        <div class="step-num">4</div>
        <div class="step-content">
          <h3>Acompanhamento contínuo</h3>
          <p>Histórico registrado com segurança. A instituição acompanha indicadores sem expor dados individuais.</p>
        </div>
      </div>
    </div>
  </section>
 
  <!-- SLIDE 5: CTA -->
  <section class="slide" id="s5">
    <div class="cta-tag">MindAcademy · 2024</div>
    <h2 class="cta-title">Sua faculdade pode ser a primeira a cuidar de verdade.</h2>
    <p class="cta-sub">Nenhum aluno precisa desaparecer em silêncio. O MindAcademy coloca o cuidado onde as pessoas já estão.</p>
    <button class="cta-btn">Fale com nossa equipe →</button>
  </section>
 
</div>
 
<!-- NARRAÇÃO FLUTUANTE -->
<div class="narr-box" id="narr-box">
  <span id="narr-label">🎙 Capa — MindAcademy</span>
  <span id="narr-text">Role para baixo ou use as setas do teclado para navegar pelo pitch.</span>
</div>
 
<script>
const slides = document.querySelectorAll('.slide');
const dots   = document.querySelectorAll('.dot');
const bar    = document.getElementById('progress-bar');
const narrLabel = document.getElementById('narr-label');
const narrText  = document.getElementById('narr-text');
 
const narrations = [
  {
    label: '🎙 Capa — MindAcademy',
    text: 'Role para baixo ou use as setas do teclado para navegar pelo pitch.'
  },
  {
    label: '🎙 Narração — Cena 1 · 0:00–0:36',
    text: '"Imagine um aluno que entrou na faculdade cheio de expectativas. Mas aos poucos, as faltas foram aumentando. As notas foram caindo. E ninguém percebeu. Não porque ninguém se importava — mas porque não havia nenhum sistema para identificar esse aluno a tempo. Segundo a Organização Mundial da Saúde, 1 em cada 4 universitários sofre com ansiedade ou depressão durante a graduação. E a grande maioria nunca recebe nenhum tipo de acompanhamento especializado. Isso não é um problema de saúde individual. É um problema institucional. E precisa de uma solução institucional."'
  },
  {
    label: '🎙 Narração — Cena 2 · 0:36–1:12',
    text: '"As faculdades já possuem serviços de apoio psicológico. Psicólogos, assistentes sociais, núcleos de apoio. Mas existe um abismo entre esses serviços e os alunos que mais precisam deles. Primeiro: a burocracia. Quem está em sofrimento raramente tem energia para navegar em sistemas complexos, preencher formulários ou ligar para marcar consultas. Segundo: a invisibilidade. O aluno que se isola, que para de participar, que desaparece da turma — esse aluno não aparece em nenhum relatório. Terceiro: a demora. Quando finalmente alguém pede ajuda, o problema já escalou para algo muito mais difícil de tratar. E o impacto aparece nas notas, nas faltas, nas desistências — e, nos casos mais graves, em situações que nenhuma instituição quer enfrentar."'
  },
  {
    label: '🎙 Narração — Cena 3 · 1:12–1:52',
    text: '"É para resolver esse problema que criamos o MindAcademy. A proposta é simples e poderosa: integrar o apoio psicológico diretamente dentro do portal acadêmico que os alunos e funcionários já usam todos os dias — o SGA. Uma nova aba. Nada de baixar aplicativo. Nada de acessar outro sistema. Nada de romper a barreira do desconhecido. Com um único clique, o aluno consegue descrever como está se sentindo, escolher o tipo de apoio que precisa e solicitar um atendimento com um profissional especializado. Tudo de forma confidencial, simples e acolhedora. Para os funcionários da instituição, o acesso é igualmente direto. A ferramenta reconhece que saúde mental não é exclusividade dos alunos — professores, técnicos e gestores também precisam de suporte."'
  },
  {
    label: '🎙 Narração — Cena 4 · 1:52–2:32',
    text: '"Mas o MindAcademy vai além do atendimento por demanda. O que diferencia essa solução é a inteligência proativa. O sistema cruza dados já disponíveis no próprio portal acadêmico para identificar alunos em situação de risco — mesmo antes que eles peçam ajuda. Faltas acima do limite permitido são um sinal de alerta. Quedas bruscas de rendimento acadêmico são outro. Avaliações negativas recebidas por colegas ou professores também entram no radar. Quando um conjunto desses indicadores é detectado, o sistema notifica automaticamente o profissional de saúde mental responsável. Esse profissional então entra em contato direto com o aluno — de forma humanizada, respeitosa e sigilosa. O objetivo não é vigiar. É chegar antes que a situação se agrave. É transformar dado em cuidado."'
  },
  {
    label: '🎙 Narração — Cena 5 · 2:32–3:00',
    text: '"Saúde mental não é um luxo. Não é um diferencial. É uma condição para que o aprendizado aconteça de verdade. Uma instituição que cuida dos seus alunos e funcionários colhe resultados melhores em retenção, em desempenho, em reputação — e, acima de tudo, em vidas. O MindAcademy é tecnologia a serviço do cuidado. É colocar o apoio onde as pessoas já estão. É fazer com que nenhum aluno precise desaparecer em silêncio. Se a sua instituição acredita que educação vai além da sala de aula — essa solução foi feita para vocês."'
  },
];
 
let current = 0;
 
function updateUI(idx) {
  bar.style.width = ((idx + 1) / slides.length * 100) + '%';
  dots.forEach((d, i) => d.classList.toggle('active', i === idx));
  narrLabel.textContent = narrations[idx].label;
  narrText.textContent  = narrations[idx].text;
}
 
function goTo(idx) {
  current = idx;
  slides[idx].scrollIntoView({ behavior: 'smooth' });
}
 
const observer = new IntersectionObserver((entries) => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      e.target.classList.add('visible');
      const idx = Array.from(slides).indexOf(e.target);
      if (idx !== -1) { current = idx; updateUI(idx); }
    }
  });
}, { threshold: 0.4 });
 
slides.forEach(s => observer.observe(s));
 
document.addEventListener('keydown', e => {
  if (e.key === 'ArrowDown' || e.key === 'ArrowRight') goTo(Math.min(current + 1, slides.length - 1));
  if (e.key === 'ArrowUp'   || e.key === 'ArrowLeft')  goTo(Math.max(current - 1, 0));
});
 
function switchTab(name) {
  document.querySelectorAll('.sga-tab').forEach(t => t.classList.remove('active'));
  document.querySelectorAll('.sga-panel').forEach(p => p.classList.remove('active'));
  const tab   = document.querySelector(`.sga-tab[onclick="switchTab('${name}')"]`);
  const panel = document.getElementById('tab-' + name);
  if (tab)   tab.classList.add('active');
  if (panel) panel.classList.add('active');
}
 
function submitApoio() {
  document.getElementById('apoio-form').style.display = 'none';
  document.getElementById('success-msg').style.display = 'block';
}
 
updateUI(0);
</script>
</body>
</html>
 
